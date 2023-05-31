//
//  ContentView.swift
//  CountriesCities
//
//  Created by N N on 30/05/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) var countries: FetchedResults<Country>
    @State var showingAddCountry = false
    @ObservedObject var vm = CountryViewModel()

    //    init() {
    //        //Use this if NavigationBarTitle is with Large Font
    ////                UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    //        //Use this if NavigationBarTitle is with displayMode = .inline
    ////        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    //    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(countries, id: \.self) { country in
                    NavigationLink {
                        CountryDetailView(country: country)
                    }
                label: {
                    Text(country.wrappedName)
                }
                .swipeActions {
                    Button {
                        vm.deleteCountry(country: country, viewContext: viewContext)
                    } label: {
                        Image(systemName: "trash")
                    }
                    .tint(.accentColor)
                    .accessibilityLabel(Text("Delete"))
                }
                }
                //                .onDelete(perform: deleteCountry(country: country, viewContext: viewContext))
            }
            .navigationTitle("Select a country")
            .scrollContentBackground(.hidden)
            .toolbar {
                //                ToolbarItem(placement: .navigationBarLeading) {
                //                    EditButton()
                //                }
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

            Button(action: {
                showingAddCountry.toggle()
            }, label: {
                Text("Add Country and City")
            })
            .sheet(isPresented: $showingAddCountry) {
                AddCountryView()
            }
            .buttonStyle(GrowingButtonView())
        }
    }
    
    //    private func addItem() {
    //        withAnimation {
    //            let newItem = Item(context: viewContext)
    //            newItem.timestamp = Date()
    //
    //            do {
    //                try viewContext.save()
    //            } catch {
    //                // Replace this implementation with code to handle the error appropriately.
    //                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
    //                let nsError = error as NSError
    //                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
    //            }
    //        }
    //    }
    //
    //    private func deleteItems(offsets: IndexSet) {
    //        withAnimation {
    //            offsets.map { items[$0] }.forEach(viewContext.delete)
    //
    //            do {
    //                try viewContext.save()
    //            } catch {
    //                // Replace this implementation with code to handle the error appropriately.
    //                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
    //                let nsError = error as NSError
    //                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
    //            }
    //        }
    //    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(
                \.managedObjectContext,
                 PersistenceController.preview.container.viewContext
            )
    }
}
