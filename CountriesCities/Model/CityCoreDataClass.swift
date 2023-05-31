//
//  City+CoreDataClass.swift
//  CoreDataDemo2Entities
//
//  Created by Julie Collazos on 25/05/2023.
//
//

import Foundation
import CoreData

@objc(City)
public class City: NSManagedObject {
    public var wrappedName: String {
        name ?? "Unknown city"
    }
}
