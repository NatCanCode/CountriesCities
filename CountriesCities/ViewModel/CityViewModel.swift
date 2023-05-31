//
//  CityViewModel.swift
//  CountriesCities
//
//  Created by N N on 30/05/2023.
//

//import Foundation
//import CoreData

//@MainActor class CityViewModel: ObservableObject {
//    init() { }
//
//    let vc = PersistenceController.shared.container.viewContext
//
//    func save() {
//        do {
//            try vc.save()
//        } catch {
//            let nsError = error as NSError
//            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//        }
//    }
//
//    func addCity(name: String, country: Country) -> City {
//        let city = City(context: vc)
//        city.name = name
//        country.addToCity(city)
//        save()
//        return city
//    }
//}
