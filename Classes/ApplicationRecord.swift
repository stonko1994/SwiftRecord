//
//  SRManagedObject.swift
//  Pods-ios-romme-v2
//
//  Created by David Steinacher on 17.04.20.
//

import Foundation
import CoreData

open class ApplicationRecord: NSManagedObject {
    open class var autoIncrementingId: String? {
        return nil
    }
}
