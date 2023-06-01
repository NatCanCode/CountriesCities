//
//  CountriesCitiesTests.swift
//  CountriesCitiesTests
//
//  Created by N N on 01/06/2023.
//

import XCTest
import CoreData
@testable import CountriesCities

final class CountriesCitiesUnitTests: XCTestCase {

    var persistentContainer: NSPersistentContainer!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try? super.setUpWithError()
        persistentContainer = NSPersistentContainer(name: "CountriesCities")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                XCTFail("Failed to set up Core Data stack: \(error)")
            }
        }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try? super.tearDownWithError()
        persistentContainer = nil
    }

//    @MainActor func testSave() {
//        // Create a test object
//        let context = persistentContainer.viewContext
//        let country = Country(context: context)
//        country.name = "TestCountry"
//
//        // Call the save function
//        // Error: "Cannot assign to property as "vc" is a "let" constant though when updated in "var", the app crashes
//        let viewModel = CountryViewModel()
//        viewModel.vc = context
//        viewModel.save()
//
//        // Fetch the object from the persistent store
//        let fetchRequest: NSFetchRequest<Country> = Country.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "name == %@", "TestCountry")
//
//        do {
//            let savedCountry = try context.fetch(fetchRequest).first
//            XCTAssertNotNil(savedCountry)
//            XCTAssertEqual(savedCountry?.name, "TestCountry")
//        } catch {
//            XCTFail("Failed to fetch the saved object: \(error)")
//        }
//    }

    @MainActor func testAddCountry() {
        // Create a managed object context for testing
        let context = persistentContainer.viewContext
        let viewModel = CountryViewModel()

        // Call the addCountry function and assert the expected results
        let countryName = "CountryName"
        let cityName = "CityName"
        let selectedFlag = "UK"
        let country = viewModel.addCountry(name: countryName, cityName: cityName, flag: selectedFlag)

        XCTAssertEqual(country.name, countryName)
        XCTAssertEqual(country.city?.count, 1)

        if let city = country.city?.anyObject() as? City {
            XCTAssertEqual(city.name, cityName)
        } else {
            XCTFail("Failed to retrieve city from the country")
        }
    }

    @MainActor func testDeleteCountry() {
        // Create a test country and associated cities
        let context = persistentContainer.viewContext
        let country = Country(context: context)
        country.name = "TestCountry"

        let city1 = City(context: context)
        city1.name = "City1"
        country.addToCity(city1)

        let city2 = City(context: context)
        city2.name = "City2"
        country.addToCity(city2)

        // Call the deleteCountry function
        let viewModel = CountryViewModel()
        viewModel.deleteCountry(country: country, viewContext: context)

        // Assert that the country and associated cities are deleted
        XCTAssertNil(country.managedObjectContext)
        XCTAssertNil(city1.managedObjectContext)
        XCTAssertNil(city2.managedObjectContext)
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
