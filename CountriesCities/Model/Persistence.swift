//
//  Persistence.swift
//  CountriesCities
//
//  Created by N N on 30/05/2023.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext

        let city1 = City(context: viewContext)
        city1.name = "London"

        let city2 = City(context: viewContext)
        city2.name = "Bath"

        let city3 = City(context: viewContext)
        city3.name = "Paris"

        let city4 = City(context: viewContext)
        city4.name = "La Rochelle"

        let city5 = City(context: viewContext)
        city5.name = "Melbourne"

        let city6 = City(context: viewContext)
        city6.name = "Sydney"

        let country1 = Country(context: viewContext)
        country1.name = "UK"
        country1.timestamp = Date()
        country1.addToCity(city1)
        country1.addToCity(city2)

        let country2 = Country(context: viewContext)
        country2.name = "France"
        country2.timestamp = Date()
        country2.addToCity(city3)
        country2.addToCity(city4)

        let country3 = Country(context: viewContext)
        country3.name = "Australia"
        country3.timestamp = Date()
        country3.addToCity(city5)
        country3.addToCity(city6)

        for _ in 0..<10 {
            let newCountry = Country(context: viewContext)
            newCountry.timestamp = Date()
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "CountriesCities")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
    }

    func save() throws {
        let context = container.viewContext
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }

    func delete(_ object: NSManagedObject) throws {
        let context = container.viewContext
        context.delete(object)
        try context.save()
    }
}
