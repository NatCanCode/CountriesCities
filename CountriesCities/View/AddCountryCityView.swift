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
    @State var countryFlag = ""
    @State var selectedFlag: String = "FR"
    @ObservedObject var vm = CountryViewModel()

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Country", text: $countryName)
                } header: {
                    Text("Add a country")
                        .foregroundColor(.accentColor)
                        .accessibilityHint("Country is a mandatory field")
                }
                Section {
                    Picker("Pick the appropriate flag", selection: $selectedFlag) {
                        ForEach(NSLocale.isoCountryCodes, id: \.self) { flag in
                            Text(vm.countryFlag(flag) + "  " + (Locale.current.localizedString(forRegionCode: flag) ?? ""))
                        }
                    }
                    .pickerStyle(.navigationLink)
                    .colorMultiply(.accentColor)
                } header: {
                    Text("Add a flag")
                        .foregroundColor(.accentColor)
                }
                Section {
                    TextField("City", text: $cityName)
                } header: {
                    Text("Add a city")
                        .foregroundColor(.accentColor)
                }
                //                Section {
                //                    TextField("Country", text: $countryFlag)
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
                        let _ = vm.addCountry(name: countryName, cityName: cityName, flag: selectedFlag)
                        dismiss()
                    } label: {
                        Text("Add")
                    }
                    .disabled(countryName == "")
                }
            }
            .navigationTitle("Add country, flag and city")
            .scrollContentBackground(.hidden)

            Button {
                let _ = vm.addCountry(name: countryName, cityName: cityName, flag: selectedFlag)
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
