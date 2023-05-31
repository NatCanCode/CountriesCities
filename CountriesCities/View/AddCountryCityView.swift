//
//  AddCountryView.swift
//  CountriesCities
//
//  Created by N N on 30/05/2023.
//

import SwiftUI
import CoreData

struct AddCountryView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss
    @State var countryName = ""
    @State var cityName = ""
//    @State var selectedFlag: FlagListView
    
    @ObservedObject var vm = CountryViewModel()

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Country", text: $countryName)
                } header: {
                    Text("Add a country")
                        .foregroundColor(.accentColor)
                }
                Section {
                    TextField("City", text: $cityName)
                } header: {
                    Text("Add a city")
                        .foregroundColor(.accentColor)
                }
//                Section {
//                    Picker("Choose a country flag", selection: $selectedFlag) {
//                        ForEach(FlagListView.allCases, id: \.self) {
//                            Text(String($0))
//                        }
//                    }
//                    .pickerStyle(.automatic)
//                    .colorMultiply(.accentColor)
//                } header: {
//                    Text("Add a flag")
//                        .foregroundColor(.accentColor)
//                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Dismiss")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        let _ = vm.addCountry(name: countryName, cityName: cityName)
                        dismiss()
                    } label: {
                        Text("Add")
                    }
                    .disabled(countryName == "")
                }
            }
            .navigationTitle("Add country and city")
            .scrollContentBackground(.hidden)

            Button {
                let _ = vm.addCountry(name: countryName, cityName: cityName)
                dismiss()
            } label: {
                Text("Add")
            }
            .buttonStyle(GrowingButtonView())
            .disabled(countryName == "")
        }
    }
}

struct AddCountryView_Previews: PreviewProvider {
    static var previews: some View {
        AddCountryView()
            .environment(
                \.managedObjectContext,
                 PersistenceController.preview.container.viewContext
            )
    }
}
