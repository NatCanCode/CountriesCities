//
//  City+CoreDataClass.swift
//  CountriesCities
//
//  Created by N N on 30/05/2023.
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
