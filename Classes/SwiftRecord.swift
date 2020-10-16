//
//  SwiftRecord.swift
//  
//  ark - http://www.arkverse.com
//  Created by Zaid on 5/7/15.
//
//

import Foundation
import CoreData
#if os(iOS)
import UIKit
#endif

open class SwiftRecord {
    
    public static var generateRelationships = false
    
    public static func setUpEntities(_ entities: [String: NSManagedObject.Type]) {
        nameToEntities = entities
    }
    
    internal static var nameToEntities: [String: NSManagedObject.Type] = [String: NSManagedObject.Type]()

    public let appName = Bundle.main.infoDictionary!["CFBundleName"] as! String
    
    open var databaseName: String {
        get {
            if let db = self._databaseName {
                return db
            } else {
                return self.appName + ".sqlite"
            }
        }
        set {
            _databaseName = newValue
            if _managedObjectContext != nil {
                _managedObjectContext = nil
            }
            if _persistentStoreCoordinator != nil {
                _persistentStoreCoordinator = nil
            }
        }
    }
    fileprivate var _databaseName: String?
    
    open var modelName: String {
        get {
            if let model = _modelName {
                return model
            } else {
                return appName
            }
        }
        set {
            _modelName = newValue
            if _managedObjectContext != nil {
                _managedObjectContext = nil
            }
            if _persistentStoreCoordinator != nil {
                _persistentStoreCoordinator = nil
            }
        }
    }
    fileprivate var _modelName: String?
    
    open var managedObjectContext: NSManagedObjectContext {
        get {
            if let context = _managedObjectContext {
                return context
            } else {
                let c = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType)
                c.persistentStoreCoordinator = persistentStoreCoordinator
                _managedObjectContext = c
                return c
            }
        }
        set {
            _managedObjectContext = newValue
        }
    }
    fileprivate var _managedObjectContext: NSManagedObjectContext?
    
    open var persistentStoreCoordinator: NSPersistentStoreCoordinator {
        if let store = _persistentStoreCoordinator {
            return store
        } else {
            let p = self.persistentStoreCoordinator(NSSQLiteStoreType, storeURL: self.sqliteStoreURL)
            _persistentStoreCoordinator = p
            return p
        }
    }
    fileprivate var _persistentStoreCoordinator: NSPersistentStoreCoordinator?
    
    open var managedObjectModel: NSManagedObjectModel {
        get {
            if let m = _managedObjectModel {
                return m
            } else {
                let modelURL = Bundle.main.url(forResource: self.modelName, withExtension: "momd")
                _managedObjectModel = NSManagedObjectModel(contentsOf: modelURL!)
                return _managedObjectModel!
            }
        }
        set {
            _managedObjectModel = newValue
        }
    }
    fileprivate var _managedObjectModel: NSManagedObjectModel?
    
    open func useInMemoryStore() {
        _persistentStoreCoordinator = self.persistentStoreCoordinator(NSInMemoryStoreType, storeURL: nil)
    }
    
    open func saveContext() -> Bool {
        if !self.managedObjectContext.hasChanges {
            return false
        }

        do {
            try self.managedObjectContext.save()
        } catch let error as NSError {
            print("Unresolved error in saving context! " + error.debugDescription)
            return false
        }
        
        return true
    }
    
    open func applicationDocumentsDirectory() -> URL {
        return FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).last!
    }
    
    open func applicationSupportDirectory() -> URL {
        return (FileManager.default.urls(for: FileManager.SearchPathDirectory.applicationSupportDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).last!).appendingPathComponent(self.appName)
    }
    
    open var sqliteStoreURL: URL {
        get {
            if let url = _sqliteStoreURL {
                return url
            } else {
                #if os(iOS)
                    let dir = self.applicationDocumentsDirectory()
                #else
                    let dir = self.applicationSupportDirectory()
                    self.createApplicationSupportDirIfNeeded(dir)
                #endif
                let url = dir.appendingPathComponent(self.databaseName)
                _sqliteStoreURL = url
                return url
            }
        }
        set {
            _sqliteStoreURL = newValue
        }
    }
    private var _sqliteStoreURL: URL?
    
    fileprivate func persistentStoreCoordinator(_ storeType: String, storeURL: URL?) -> NSPersistentStoreCoordinator {
        let c = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        do {
            try c.addPersistentStore(ofType: storeType, configurationName: nil, at: storeURL, options: [NSMigratePersistentStoresAutomaticallyOption:true, NSInferMappingModelAutomaticallyOption:true])
        } catch let error as NSError {
            print("ERROR WHILE CREATING PERSISTENT STORE COORDINATOR! " + error.debugDescription)
        }
        return c
    }
    
    fileprivate func createApplicationSupportDirIfNeeded(_ dir: URL) {
        if FileManager.default.fileExists(atPath: dir.absoluteString) {
            return
        }
        do {
            try FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true, attributes: nil)
        } catch let error as NSError {
            print("ERROR WHILE CREATING APPLICATION SUPPORT DIRECTORY! " + error.debugDescription)
        }
    }
    fileprivate init() {
        #if os(iOS)
        NotificationCenter.default.addObserver(self, selector: #selector(SwiftRecord.applicationWillTerminate), name: UIApplication.willTerminateNotification, object: nil)
        #endif
    }
    @objc open func applicationWillTerminate() {
    #if os(iOS)
        NotificationCenter.default.removeObserver(self)
        _ = saveContext()
    #endif
    }
    // singleton
    public static let sharedRecord = SwiftRecord()
}

public extension NSManagedObjectContext {
    static var defaultContext: NSManagedObjectContext {
        return SwiftRecord.sharedRecord.managedObjectContext
    }
}

internal extension String {
    var camelCase: String {
        let spaced = self.replacingOccurrences(of: "_", with: " ")
        let capitalized = spaced.capitalized
        let spaceless = capitalized.replacingOccurrences(of: " ", with: "")
        return spaceless.replacingCharacters(in: (spaceless.startIndex ..< spaceless.index(after: spaceless.startIndex)), with: "\(spaceless[spaceless.startIndex])".lowercased())
    }
}

extension NSObject {
    // create a static method to get a swift class for a string name
    class func swiftClassFromString(_ className: String) -> AnyClass! {
        // get the project name
        if  let appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String {
            // generate the full name of your class (take a look into your "YourProject-swift.h" file)
            let classStringName = "_TtC\(appName.utf16.count)\(appName)\(className.count)\(className)"
            // return the class!
            
            return NSClassFromString(classStringName)
        }
        return nil;
    }
}
