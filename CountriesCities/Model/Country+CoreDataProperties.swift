//
//  Country+CoreDataProperties.swift
//  CountriesCities
//
//  Created by N N on 30/05/2023.
//
//

import Foundation
import CoreData


extension Country {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Country> {
        return NSFetchRequest<Country>(entityName: "Country")
    }

    @NSManaged public var timestamp: Date?
    @NSManaged public var name: String?
    @NSManaged public var image: String?
    @NSManaged public var flag: String?
    @NSManaged public var city: NSSet?
//    @NSManaged public var city: NSOrderedSet?
}

// MARK: Generated accessors for city
extension Country {

    @objc(insertObject:inCityAtIndex:)
    @NSManaged public func insertIntoCity(_ value: City, at idx: Int)

    @objc(removeObjectFromCityAtIndex:)
    @NSManaged public func removeFromCity(at idx: Int)

    @objc(insertCity:atIndexes:)
    @NSManaged public func insertIntoCity(_ values: [City], at indexes: NSIndexSet)

    @objc(removeCityAtIndexes:)
    @NSManaged public func removeFromCity(at indexes: NSIndexSet)

    @objc(replaceObjectInCityAtIndex:withObject:)
    @NSManaged public func replaceCity(at idx: Int, with value: City)

    @objc(replaceCityAtIndexes:withCity:)
    @NSManaged public func replaceCity(at indexes: NSIndexSet, with values: [City])

    @objc(addCityObject:)
    @NSManaged public func addToCity(_ value: City)

    @objc(removeCityObject:)
    @NSManaged public func removeFromCity(_ value: City)

    @objc(addCity:)
    @NSManaged public func addToCity(_ values: NSOrderedSet)

    @objc(removeCity:)
    @NSManaged public func removeFromCity(_ values: NSOrderedSet)
}

extension Country : Identifiable {
}
