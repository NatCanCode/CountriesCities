//
//  AddCityView.swift
//  CountriesCities
//
//  Created by N N on 30/05/2023.
//

//import SwiftUI
//import CoreData
//
//struct AddCityView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//    @Environment(\.dismiss) var dismiss
//    @State var countryName = ""
//    @State var cityName = ""
//    @ObservedObject var vm = CountryViewModel()
//
//    var body: some View {
//        NavigationStack {
//            Form {
//                Section {
//                    TextField("Country", text: $countryName)
//                } header: {
//                    Text("Country")
//                        .foregroundColor(.accentColor)
//                }
//                Section {
//                    TextField("City", text: $cityName)
//                } header: {
//                    Text("Add zero to three cities")
//                        .foregroundColor(.accentColor)
//                }
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button {
//                        dismiss()
//                    } label: {
//                        Text("Cancel")
//                    }
//                }
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button {
//                        let _ = vm.addCountry(name: countryName, cityName: cityName)
//                        dismiss()
//                    } label: {
//                        Text("Add")
//                    }
//                    .disabled(countryName == "")
//                }
//            }
//            .navigationTitle("Add country and city")
//            .scrollContentBackground(.hidden)
//
//            Button {
//                let _ = vm.addCountry(name: countryName, cityName: cityName)
//                dismiss()
//            } label: {
//                Text("Add")
//            }
//            .buttonStyle(GrowingButtonView())
//            .disabled(countryName == "")
//        }
//    }
//}
//
//struct AddCityView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddCountryView()
//            .environment(
//                \.managedObjectContext,
//                 PersistenceController.preview.container.viewContext
//            )
//    }
//}
