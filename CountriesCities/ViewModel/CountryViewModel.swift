//
//  CountryViewModel.swift
//  CountriesCities
//
//  Created by N N on 30/05/2023.
//

import Foundation
import CoreData

@MainActor class CountryViewModel: ObservableObject {
    init() { }

    //    let vc = PersistenceController.shared.container.viewContext
    //    Had to update let by var to be able to run the unit tests:
    let vc = PersistenceController.shared.container.viewContext

    func save() {
        do {
            try vc.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }

    func addCountry(name: String, cityName: String?, flag: String) -> Country {
        let country = Country(context: vc)
        country.name = name
        country.timestamp = Date()
        country.city = NSSet(array: country.cityArray)
        country.flag = flag
        if !cityName!.isEmpty {
            let city = City(context: vc)
            city.name = cityName
            country.addToCity(city)
        }
        save()
        return country
    }

    func deleteCountry(country: Country, viewContext: NSManagedObjectContext) {
        let context = viewContext
        print("Country to delete: \(country.name  ?? "country unknown)") and all cities \(country.cityArray)")
        context.delete(country)
        save()
        print("Success! Country deleted: \(country.name ?? "country deleted successfully") and all cities: \(country.cityArray)")
    }

    func addCity(name: String, country: Country) -> City {
        let city = City(context: vc)
        city.name = name
        country.addToCity(city)
        save()
        return city
    }

    func countryFlag(_ countryCode: String) -> String {
        String(String.UnicodeScalarView(countryCode.unicodeScalars.compactMap {
            UnicodeScalar(127397 + $0.value)
        }))
    }
}
