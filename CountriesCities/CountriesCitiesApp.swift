//
//  CountriesCitiesApp.swift
//  CountriesCities
//
//  Created by N N on 30/05/2023.
//

import SwiftUI

@main
struct CountriesCitiesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
