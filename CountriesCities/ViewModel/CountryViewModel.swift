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

    let vc = PersistenceController.shared.container.viewContext

    func save() {
        do {
            try vc.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }

    func addCountry(name: String, cityName: String?) -> Country {
        let country = Country(context: vc)
        country.name = name
        country.timestamp = Date()
        country.city = NSSet(array: country.cityArray)
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
}
