import Foundation
import CoreData

extension ApplicationRecord {

    //Querying
    @nonobjc public static func all(context: NSManagedObjectContext = NSManagedObjectContext.defaultContext) -> [ApplicationRecord] {
        return self.fetch(predicate: nil, context: context, sortQuery: nil, limit: nil)
    }

    @nonobjc public static func all(context: NSManagedObjectContext = NSManagedObjectContext.defaultContext, sort: String?) -> [ApplicationRecord] {
        return self.fetch(predicate: nil, context: context, sortQuery: sort, limit: nil)
    }

    @nonobjc public static func all(context: NSManagedObjectContext = NSManagedObjectContext.defaultContext, sort: [[String: Any]]?) -> [ApplicationRecord] {
        return self.fetch(predicate: nil, context: context, sortConditions: sort, limit: nil)
    }

    @nonobjc public static func findOrCreate(_ properties: [String: Any]) -> ApplicationRecord {
        return self.findOrCreate(properties, context: NSManagedObjectContext.defaultContext)
    }

    @nonobjc public static func findOrCreate(_ properties: [String: Any], context: NSManagedObjectContext) -> ApplicationRecord {
        let transformed = self.transformProperties(properties, context: context)
        let existing: ApplicationRecord? = self.query(transformed, context: context).first
        return existing ?? self.create(transformed, context:context)
    }

    @nonobjc public static func find(_ condition: String, context: NSManagedObjectContext = NSManagedObjectContext.defaultContext, argsArray: [Any]? = nil) -> ApplicationRecord? {
        return self.query(condition, context: context, limit: 1, argsArray: argsArray).first
    }

    @nonobjc public static func find(_ condition: String, context: NSManagedObjectContext = NSManagedObjectContext.defaultContext, args: Any...) -> ApplicationRecord? {
        return self.query(condition, context: context, limit: 1, argsArray: args).first
    }

    @nonobjc public static func find(_ condition: String, context: NSManagedObjectContext = NSManagedObjectContext.defaultContext, sort: String?, argsArray: [Any]? = nil) -> ApplicationRecord? {
        return self.query(condition, context: context, sort: sort, limit: 1, argsArray: argsArray).first
    }

    @nonobjc public static func find(_ condition: String, context: NSManagedObjectContext = NSManagedObjectContext.defaultContext, sort: String?, args: Any...) -> ApplicationRecord? {
        return self.query(condition, context: context, sort: sort, limit: 1, argsArray: args).first
    }

    @nonobjc public static func find(_ condition: String, context: NSManagedObjectContext = NSManagedObjectContext.defaultContext, sort: [[String: Any]]?, argsArray: [Any]? = nil) -> ApplicationRecord? {
        return self.query(condition, context: context, sort: sort, limit: 1, argsArray: argsArray).first
    }

    @nonobjc public static func find(_ condition: String, context: NSManagedObjectContext = NSManagedObjectContext.defaultContext, sort: [[String: Any]]?, args: Any...) -> ApplicationRecord? {
        return self.query(condition, context: context, sort: sort, limit: 1, argsArray: args).first
    }

    @nonobjc public static func find(_ condition: [String: Any], context: NSManagedObjectContext = NSManagedObjectContext.defaultContext, sort: String?) -> ApplicationRecord? {
        return self.query(condition, context: context, sort: sort, limit: 1).first
    }

    @nonobjc public static func find(_ condition: [String: Any], context: NSManagedObjectContext = NSManagedObjectContext.defaultContext, sort: [[String: Any]]?) -> ApplicationRecord? {
        return self.query(condition, context: context, sort: sort, limit: 1).first
    }

    @nonobjc public static func find(_ condition: NSPredicate, context: NSManagedObjectContext = NSManagedObjectContext.defaultContext, sort: String?) -> ApplicationRecord? {
        return self.query(condition, context: context, sort: sort, limit: 1).first
    }

    @nonobjc public static func find(_ condition: NSPredicate, context: NSManagedObjectContext = NSManagedObjectContext.defaultContext, sort: [[String: Any]]?) -> ApplicationRecord? {
        return self.query(condition, context: context, sort: sort, limit: 1).first
    }

    @nonobjc public static func query(_ condition: String, context: NSManagedObjectContext = NSManagedObjectContext.defaultContext, limit: Int? = nil, argsArray: [Any]? = nil) -> [ApplicationRecord] {
        return self.fetch(query: condition, context: context, sortDescriptors: nil, limit: limit, args: argsArray)
    }

    @nonobjc public static func query(_ condition: String, context: NSManagedObjectContext = NSManagedObjectContext.defaultContext, limit: Int? = nil, args: Any...) -> [ApplicationRecord] {
        return self.fetch(query: condition, context: context, sortDescriptors: nil, limit: limit, args: args)
    }

    @nonobjc public static func query(_ condition: String, context: NSManagedObjectContext = NSManagedObjectContext.defaultContext, sort: String?, limit: Int? = nil, argsArray: [Any]? = nil) -> [ApplicationRecord] {
        return self.fetch(query: condition, context: context, sortQuery: sort, limit: limit, args: argsArray)
    }

    @nonobjc public static func query(_ condition: String, context: NSManagedObjectContext = NSManagedObjectContext.defaultContext, sort: String?, limit: Int? = nil, args: Any...) -> [ApplicationRecord] {
        return self.fetch(query: condition, context: context, sortQuery: sort, limit: limit, args: args)
    }

    @nonobjc public static func query(_ condition: String, context: NSManagedObjectContext = NSManagedObjectContext.defaultContext, sort: [[String: Any]]?, limit: Int? = nil, argsArray: [Any]? = nil) -> [ApplicationRecord] {
        return self.fetch(query: condition, context: context, sortConditions: sort, limit: limit, args: argsArray)
    }

    @nonobjc public static func query(_ condition: String, context: NSManagedObjectContext = NSManagedObjectContext.defaultContext, sort: [[String: Any]]?, limit: Int? = nil, args: Any...) -> [ApplicationRecord] {
        return self.fetch(query: condition, context: context, sortConditions: sort, limit: limit, args: args)
    }

    @nonobjc public static func query(_ condition: String, context: NSManagedObjectContext = NSManagedObjectContext.defaultContext, sort: [String: Any]?, limit: Int? = nil, argsArray: [Any]? = nil) -> [ApplicationRecord] {
        return self.fetch(query: condition, context: context, sortCondition: sort, limit: limit, args: argsArray)
    }

    @nonobjc public static func query(_ condition: String, context: NSManagedObjectContext = NSManagedObjectContext.defaultContext, sort: [String: Any]?, limit: Int? = nil, args: Any...) -> [ApplicationRecord] {
        return self.fetch(query: condition, context: context, sortCondition: sort, limit: limit, args: args)
    }

    @nonobjc public static func query(_ condition: [String: Any], context: NSManagedObjectContext = NSManagedObjectContext.defaultContext, limit: Int? = nil) -> [ApplicationRecord] {
        return self.fetch(properties: condition, context: context, sortDescriptors: nil, limit: limit)
    }

    @nonobjc public static func query(_ condition: [String: Any], context: NSManagedObjectContext = NSManagedObjectContext.defaultContext, sort: String?, limit: Int? = nil) -> [ApplicationRecord] {
        return self.fetch(properties: condition, context: context, sortQuery: sort, limit: limit)
    }

    @nonobjc public static func query(_ condition: [String: Any], context: NSManagedObjectContext = NSManagedObjectContext.defaultContext, sort: [[String: Any]]?, limit: Int? = nil) -> [ApplicationRecord] {
        return self.fetch(properties: condition, context: context, sortConditions: sort, limit: limit)
    }

    @nonobjc public static func query(_ condition: [String: Any], context: NSManagedObjectContext = NSManagedObjectContext.defaultContext, sort: [String: Any]?, limit: Int? = nil) -> [ApplicationRecord] {
        return self.fetch(properties: condition, context: context, sortCondition: sort, limit: limit)
    }

    @nonobjc public static func query(_ condition: NSPredicate, context: NSManagedObjectContext = NSManagedObjectContext.defaultContext, limit: Int? = nil) -> [ApplicationRecord] {
        return self.fetch(predicate: condition, context: context, sortDescriptors: nil, limit: limit)
    }

    @nonobjc public static func query(_ condition: NSPredicate, context: NSManagedObjectContext = NSManagedObjectContext.defaultContext, sort: [[String: Any]]?, limit: Int? = nil) -> [ApplicationRecord] {
        return self.fetch(predicate: condition, context: context, sortConditions: sort, limit: limit)
    }

    @nonobjc public static func query(_ condition: NSPredicate, context: NSManagedObjectContext = NSManagedObjectContext.defaultContext, sort: [String: Any]?, limit: Int? = nil) -> [ApplicationRecord] {
        return self.fetch(predicate: condition, context: context, sortCondition: sort, limit: limit)
    }

    @nonobjc public static func query(_ condition: NSPredicate, context: NSManagedObjectContext = NSManagedObjectContext.defaultContext, sort: String?, limit: Int? = nil) -> [ApplicationRecord] {
        return self.fetch(predicate: condition, context: context, sortQuery: sort, limit: limit)
    }

    // Aggregation
    @nonobjc public static func count(_ context: NSManagedObjectContext = NSManagedObjectContext.defaultContext) -> Int {
        return self.countForFetch(nil, context: context)
    }

    @nonobjc public static func count(query: [String: Any], context: NSManagedObjectContext = NSManagedObjectContext.defaultContext) -> Int {
        let predicate = self.predicate(query)
        return self.countForFetch(predicate, context: context)
    }

    @nonobjc public static func count(query: String, context: NSManagedObjectContext = NSManagedObjectContext.defaultContext, args: Any...) -> Int {
        let predicate = self.predicate(query, args: args)
        return self.countForFetch(predicate, context: context)
    }

    @nonobjc public static func count(query: NSPredicate, context: NSManagedObjectContext = NSManagedObjectContext.defaultContext) -> Int {
        return self.countForFetch(query, context: context)
    }

    // Creation / Deletion
    @nonobjc public static func create() -> ApplicationRecord {
        return self.create(context: NSManagedObjectContext.defaultContext)
    }

    @nonobjc public static func create(context: NSManagedObjectContext) -> ApplicationRecord {
        let o = NSEntityDescription.insertNewObject(forEntityName: self.entityName(), into: context) as! ApplicationRecord
        if let idprop = self.autoIncrementingId {
            o.setPrimitiveValue(NSNumber(value: self.nextId() as Int), forKey: idprop)
        }
        return o
    }

    @nonobjc public static func create(properties: [String: Any]) -> ApplicationRecord {
        return self.create(properties, context: NSManagedObjectContext.defaultContext)
    }

    @nonobjc public static func create(_ properties: [String: Any], context: NSManagedObjectContext) -> ApplicationRecord {
        let newEntity: ApplicationRecord = self.create(context: context)
        newEntity.update(properties)
        if let idprop = self.autoIncrementingId {
            if newEntity.primitiveValue(forKey: idprop) == nil {
                newEntity.setPrimitiveValue(NSNumber(value: self.nextId() as Int), forKey: idprop)
            }
        }
        return newEntity
    }

    public static func autoIncrements() -> Bool {
        return self.autoIncrementingId != nil
    }

    public static func nextId() -> Int {
        let key = "SwiftRecord-" + self.entityName() + "-ID"
        if let _ = self.autoIncrementingId {
            let id = UserDefaults.standard.integer(forKey: key)
            UserDefaults.standard.set(id + 1, forKey: key)
            return id
        }
        return 0
    }

    open func update(_ properties: [String: Any]) {
        if (properties.count == 0) {
            return
        }
        let context = self.managedObjectContext ?? NSManagedObjectContext.defaultContext
        let transformed = type(of: self).transformProperties(properties, context: context)
        //Finish
        for (key, value) in transformed {
            self.willChangeValue(forKey: key)
            self.setSafeValue(value as AnyObject?, forKey: key)
            self.didChangeValue(forKey: key)
        }
    }

    public static func save() -> Bool {
        do {
            try NSManagedObjectContext.defaultContext.save()
            return true
        } catch let e as NSError {
            print("Save Error: \(e)")
            return false
        }
    }

    open func save() -> Bool {
        return self.saveTheContext()
    }

    open func delete() {
        self.managedObjectContext!.delete(self)
    }

    public static func deleteAll() {
        self.deleteAll(NSManagedObjectContext.defaultContext)
    }

    public static func deleteAll(_ context: NSManagedObjectContext) {
        for o in self.all(context: context) {
            o.delete()
        }
    }

    public static func entityName() -> String {
        var name = NSStringFromClass(self)
        if name.range(of: ".") != nil {

            let comp = name.split {$0 == "."}.map { String($0) }
            if comp.count > 1 {
                name = comp.last!
            }
        }
        if name.range(of: "_") != nil {
            var comp = name.split {$0 == "_"}.map { String($0) }
            var last: String = ""
            var remove = -1
            for (i,s) in comp.reversed().enumerated() {
                if last == s {
                    remove = i
                }
                last = s
            }
            if remove > -1 {
                comp.remove(at: remove)
                name = comp.joined(separator: "_")
            }
        }
        return name
    }

    //Private

    fileprivate static func transformProperties(_ properties: [String: Any], context: NSManagedObjectContext) -> [String: Any]{
        let entity = NSEntityDescription.entity(forEntityName: self.entityName(), in: context)!
        let attrs = entity.attributesByName
        let rels = entity.relationshipsByName

        var transformed = [String: Any]()
        for (key, value) in properties {
            let localKey = self.keyForRemoteKey(key, context: context)
            if attrs[localKey] != nil {
                transformed[localKey] = value
            } else if let rel = rels[localKey] {
                if SwiftRecord.generateRelationships {
                    if rel.isToMany {
                        if let array = value as? [[String: Any]] {
                            transformed[localKey] = self.generateSet(rel, array: array, context: context)
                        } else {
                            #if DEBUG
                                print("Invalid value for relationship generation in \(NSStringFromClass(self)).\(localKey)")
                                print(value)
                            #endif
                        }
                    } else if let dict = value as? [String: Any] {
                        transformed[localKey] = self.generateObject(rel, dict: dict, context: context)
                    } else {
                        #if DEBUG
                            print("Invalid value for relationship generation in \(NSStringFromClass(self)).\(localKey)")
                            print(value)
                        #endif
                    }
                }
            }
        }
        return transformed
    }

    fileprivate static func predicate(_ properties: [String: Any]?) -> NSPredicate? {
        guard let properties = properties else {
            return nil
        }

        var preds = [NSPredicate]()
        for (key, value) in properties {
            preds.append(NSPredicate(format: "%K = %@", argumentArray: [key, value]))
        }
        return NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and, subpredicates: preds)
    }

    fileprivate static func predicate(_ condition: String?, args: [Any]? = nil) -> NSPredicate? {
        guard let condition = condition else {
            return nil
        }

        return NSPredicate(format: condition, argumentArray: args)
    }

    fileprivate static func sortDescriptor(_ dict: [String: Any]) -> NSSortDescriptor {
        let isAscending = (dict.values.first as! String).uppercased() != "DESC"
        return NSSortDescriptor(key: dict.keys.first!, ascending: isAscending)
    }

    fileprivate static func sortDescriptor(_ string: String) -> NSSortDescriptor {

        var key = string
        let components = string.split {$0 == " "}.map { String($0) }
        var isAscending = true
        if (components.count > 1) {
            key = components[0]
            isAscending = components[1] == "ASC"
        }
        return NSSortDescriptor(key: key, ascending: isAscending)
    }

    fileprivate static func sortDescriptors(_ s: String?) -> [NSSortDescriptor]? {
        guard let s = s else {
            return nil
        }

        let components = s.split {$0 == ","}.map { String($0) }
        var ds = [NSSortDescriptor]()
        for sub in components {
            ds.append(self.sortDescriptor(sub))
        }
        return ds
    }

    fileprivate static func sortDescriptors(_ ds: [[String: Any]]?) -> [NSSortDescriptor]? {
        guard let ds = ds else {
            return nil
        }

        var ret = [NSSortDescriptor]()
        for d in ds {
            ret.append(self.sortDescriptor(d))
        }
        return ret
    }

    fileprivate static func createFetchRequest(_ context: NSManagedObjectContext) -> NSFetchRequest<NSFetchRequestResult> {
        let request = NSFetchRequest<NSFetchRequestResult>()
        request.entity = NSEntityDescription.entity(forEntityName: self.entityName(), in: context)
        return request
    }

    fileprivate static func fetch(query: String?, context: NSManagedObjectContext, sortQuery: String?, limit: Int?, args: [Any]? = nil) -> [ApplicationRecord] {
        let request = self.createFetchRequest(context)

        request.predicate = self.predicate(query, args: args)
        request.sortDescriptors = self.sortDescriptors(sortQuery)

        if let lim = limit {
            request.fetchLimit = lim
        }

        return fetch(request: request, context: context)
    }

    fileprivate static func fetch(query: String?, context: NSManagedObjectContext, sortConditions: [[String: Any]]?, limit: Int?, args: [Any]? = nil) -> [ApplicationRecord] {
        let request = self.createFetchRequest(context)

        request.predicate = self.predicate(query, args: args)
        request.sortDescriptors = self.sortDescriptors(sortConditions)

        if let lim = limit {
            request.fetchLimit = lim
        }

        return fetch(request: request, context: context)
    }

    fileprivate static func fetch(query: String?, context: NSManagedObjectContext, sortCondition: [String: Any]?, limit: Int?, args: [Any]? = nil) -> [ApplicationRecord] {
        var conditions: [[String: Any]]?

        if let condition = sortCondition {
            conditions = [condition]
        }

        return fetch(query: query, context: context, sortConditions: conditions, limit: limit, args: args)
    }


    fileprivate static func fetch(query: String?, context: NSManagedObjectContext, sortDescriptors: [NSSortDescriptor]?, limit: Int?, args: [Any]? = nil) -> [ApplicationRecord] {
        let request = self.createFetchRequest(context)

        request.predicate = self.predicate(query, args: args)
        request.sortDescriptors = sortDescriptors

        if let lim = limit {
            request.fetchLimit = lim
        }

        return fetch(request: request, context: context)
    }

    fileprivate static func fetch(properties: [String: Any]?, context: NSManagedObjectContext, sortQuery: String?, limit: Int?) -> [ApplicationRecord] {
        let request = self.createFetchRequest(context)

        request.predicate = self.predicate(properties)
        request.sortDescriptors = self.sortDescriptors(sortQuery)

        if let lim = limit {
            request.fetchLimit = lim
        }

        return fetch(request: request, context: context)
    }

    fileprivate static func fetch(properties: [String: Any]?, context: NSManagedObjectContext, sortConditions: [[String: Any]]?, limit: Int?) -> [ApplicationRecord] {
        let request = self.createFetchRequest(context)

        request.predicate = self.predicate(properties)
        request.sortDescriptors = self.sortDescriptors(sortConditions)

        if let lim = limit {
            request.fetchLimit = lim
        }

        return fetch(request: request, context: context)
    }

    fileprivate static func fetch(properties: [String: Any]?, context: NSManagedObjectContext, sortCondition: [String: Any]?, limit: Int?) -> [ApplicationRecord] {
        var conditions: [[String: Any]]?

        if let condition = sortCondition {
            conditions = [condition]
        }

        return fetch(properties: properties, context: context, sortConditions: conditions, limit: limit)
    }

    fileprivate static func fetch(properties: [String: Any]?, context: NSManagedObjectContext, sortDescriptors: [NSSortDescriptor]?, limit: Int?) -> [ApplicationRecord] {
        let request = self.createFetchRequest(context)

        request.predicate = self.predicate(properties)
        request.sortDescriptors = sortDescriptors

        if let lim = limit {
            request.fetchLimit = lim
        }

        return fetch(request: request, context: context)
    }

    fileprivate static func fetch(predicate: NSPredicate?, context: NSManagedObjectContext, sortQuery: String?, limit: Int?) -> [ApplicationRecord] {
        let request = self.createFetchRequest(context)

        request.predicate = predicate
        request.sortDescriptors = self.sortDescriptors(sortQuery)

        if let lim = limit {
            request.fetchLimit = lim
        }

        return fetch(request: request, context: context)
    }

    fileprivate static func fetch(predicate: NSPredicate?, context: NSManagedObjectContext, sortConditions: [[String: Any]]?, limit: Int?) -> [ApplicationRecord] {
        let request = self.createFetchRequest(context)

        request.predicate = predicate
        request.sortDescriptors = self.sortDescriptors(sortConditions)

        if let lim = limit {
            request.fetchLimit = lim
        }

        return fetch(request: request, context: context)
    }

    fileprivate static func fetch(predicate: NSPredicate?, context: NSManagedObjectContext, sortCondition: [String: Any]?, limit: Int?) -> [ApplicationRecord] {
        var conditions: [[String: Any]]?

        if let condition = sortCondition {
            conditions = [condition]
        }

        return fetch(predicate: predicate, context: context, sortConditions: conditions, limit: limit)
    }

    fileprivate static func fetch(predicate: NSPredicate?, context: NSManagedObjectContext, sortDescriptors: [NSSortDescriptor]?, limit: Int?) -> [ApplicationRecord] {
        let request = self.createFetchRequest(context)

        request.predicate = predicate
        request.sortDescriptors = sortDescriptors

        if let lim = limit {
            request.fetchLimit = lim
        }

        return fetch(request: request, context: context)
    }

    fileprivate static func fetch(request: NSFetchRequest<NSFetchRequestResult>, context: NSManagedObjectContext) -> [ApplicationRecord] {
        var result : [ApplicationRecord]

        do {
            var fetchResult : [AnyObject]
            try fetchResult = context.fetch(request)

            if let fetchResultTyped = fetchResult as? [ApplicationRecord] {
                result = fetchResultTyped
            } else {
                throw NSError(domain: "Fetch results unable to be casted to [ApplicationRecord]", code: 0, userInfo: nil)
            }
        } catch let error as NSError {
            print("Error executing fetch request \(request): " + error.description)
            result = [ApplicationRecord]()
        }

        return result
    }

    fileprivate static func countForFetch(_ predicate: NSPredicate?, context: NSManagedObjectContext) -> Int {
        let request = self.createFetchRequest(context)
        request.predicate = predicate

        return try! context.count(for: request)
    }

    fileprivate static func count(_ predicate: NSPredicate, context: NSManagedObjectContext) -> Int {
        let request = self.createFetchRequest(context)
        request.predicate = predicate
        return try! context.count(for: request)
    }

    fileprivate func saveTheContext() -> Bool {
        if self.managedObjectContext == nil || !self.managedObjectContext!.hasChanges {
            return true
        }

        do {
            try self.managedObjectContext!.save()
        } catch let error as NSError {
            print("Unresolved error in saving context for entity:")
            print(self)
            print("!\nError: " + error.debugDescription)
            return false
        }

        return true
    }

    fileprivate func setSafeValue(_ value: AnyObject?, forKey key: String) {
        if (value == nil) {
            self.setNilValueForKey(key)
            return
        }
        let val: AnyObject = value!
        if let attr = self.entity.attributesByName[key] {
            let attrType = attr.attributeType
            if attrType == NSAttributeType.stringAttributeType && value is NSNumber {
                self.setPrimitiveValue((val as! NSNumber).stringValue, forKey: key)
            } else if let s = val as? String {
                if self.isIntegerAttributeType(attrType) {
                    self.setPrimitiveValue(NSNumber(value: val.intValue as Int), forKey: key)
                    return
                } else if attrType == NSAttributeType.booleanAttributeType {
                    self.setPrimitiveValue(NSNumber(value: val.boolValue as Bool), forKey: key)
                    return
                } else if (attrType == NSAttributeType.floatAttributeType) {
                    self.setPrimitiveValue(NSNumber(floatLiteral: val.doubleValue), forKey: key)
                    return
                } else if (attrType == NSAttributeType.dateAttributeType) {
                    self.setPrimitiveValue(type(of: self).dateFormatter.date(from: s), forKey: key)
                    return
                }
            }
        }
        self.setPrimitiveValue(value, forKey: key)
    }

    fileprivate func isIntegerAttributeType(_ attrType: NSAttributeType) -> Bool {
        return attrType == NSAttributeType.integer16AttributeType || attrType == NSAttributeType.integer32AttributeType || attrType == NSAttributeType.integer64AttributeType
    }

    fileprivate static var dateFormatter: DateFormatter {
        if _dateFormatter == nil {
            _dateFormatter = DateFormatter()
            _dateFormatter!.dateFormat = "yyyy-MM-dd HH:mm:ss z"
        }
        return _dateFormatter!
    }
    fileprivate static var _dateFormatter: DateFormatter?
}

extension ApplicationRecord {
    open class func mappings() -> [String: String] {
        return [String: String]()
    }

    public static func keyForRemoteKey(_ remote: String, context: NSManagedObjectContext) -> String {
        if let s = cachedMappings[remote] {
            return s
        }
        let entity = NSEntityDescription.entity(forEntityName: self.entityName(), in: context)!
        let properties = entity.propertiesByName
        if properties[remote] != nil {
            _cachedMappings![remote] = remote
            return remote
        }

        let camelCased = remote.camelCase
        if properties[camelCased] != nil {
            _cachedMappings![remote] = camelCased
            return camelCased
        }
        _cachedMappings![remote] = remote
        return remote
    }
    fileprivate static var cachedMappings: [String:String] {
        if let m = _cachedMappings {
            return m
        } else {
            var m = [String:String]()
            for (key, value) in mappings() {
                m[value] = key
            }
            _cachedMappings = m
            return m
        }
    }
    fileprivate static var _cachedMappings: [String: String]?

    fileprivate static func generateSet(_ rel: NSRelationshipDescription, array: [[String: Any]], context: NSManagedObjectContext) -> NSSet {
        var cls: ApplicationRecord.Type?
        if SwiftRecord.nameToEntities.count > 0 {
            cls = SwiftRecord.nameToEntities[rel.destinationEntity!.managedObjectClassName] as? ApplicationRecord.Type
        }
        if cls == nil {
            cls = (NSClassFromString(rel.destinationEntity!.managedObjectClassName) as! ApplicationRecord.Type)
        } else {
            print("Got class name from entity setup")
        }
        let set = NSMutableSet()
        for d in array {
            set.add(cls!.findOrCreate(d, context: context))
        }
        return set
    }

    fileprivate static func generateObject(_ rel: NSRelationshipDescription, dict: [String: Any], context: NSManagedObjectContext) -> ApplicationRecord {
        let entity = rel.destinationEntity!

        let cls: ApplicationRecord.Type = NSClassFromString(entity.managedObjectClassName) as! ApplicationRecord.Type
        return cls.findOrCreate(dict, context: context)
    }

    public static func primaryKey() -> String {
        assertionFailure("Primary key undefined in \(NSStringFromClass(self)). Override primaryKey if you want to support automatic creation, otherwise disable this feature")
        return ""
    }
}
