//
//  CountryDetailView.swift
//  CountriesCities
//
//  Created by N N on 30/05/2023.
//

import SwiftUI
import CoreData

struct CountryDetailView: View {
    @FetchRequest(sortDescriptors: []) var countries: FetchedResults<Country>
    let country: Country
    @State var showingAddCountry = false
    @ObservedObject var vm = CountryViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .center, spacing: 24) {
                    Text(country.name ?? "Country name missing")
                        .font(.largeTitle)
                        .fontWeight(.semibold)

//                    Image(country.name ?? "Flag missing")
//                        .resizable()
//                        .scaledToFit()
//                        .cornerRadius(6)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 6)
//                                .stroke(.black, lineWidth: 0.1)
//                        )

                    Text(vm.countryFlag(country.flag ?? ""))
                        .font(.system(size: 240))

                    VStack(spacing: 16) {
                        ForEach(country.cityArray, id: \.self) { city in
                            Text(city.name ?? "")
                                .font(.title2)
                        }
                        Spacer()
                    }
                }
                .padding(20)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAddCountry.toggle()
                    }, label: {
                        Label("Add Country", systemImage: "plus")
                    })
                    .sheet(isPresented: $showingAddCountry) {
                        AddCountryView()
                    }
                }
            }
        }
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static let persistence = PersistenceController.preview
    static var country: Country = {
        let context = persistence.container.viewContext
        let country = Country(context: context)
        country.name = "UK"
        return country
    }()

    static var image: Country = {
        let context = persistence.container.viewContext
        let image = Country(context: context)
        image.name = "UK"
        return image
    }()

    static var city: City = {
        let context = persistence.container.viewContext
        let city = City(context: context)
        city.name = "London"
        return city
    }()

    static var previews: some View {
        CountryDetailView(country: country)
            .environment(
                \.managedObjectContext,
                 PersistenceController.preview.container.viewContext
            )
    }
}
