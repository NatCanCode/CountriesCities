//
//  FlagPickerView.swift
//  CountriesCities
//
//  Created by N N on 31/05/2023.
//

//import SwiftUI
//
//struct FlagListView: View {
//
//    var body: some View {
//        List(NSLocale.isoCountryCodes, id: \.self) { countryCode in
//            HStack {
//                Text(countryFlag(countryCode))
//                Text(Locale.current.localizedString(forRegionCode: countryCode) ?? "")
//                Spacer()
//                Text(countryCode)
//            }
//        }
//    }
//
//    func countryFlag(_ countryCode: String) -> String {
//        String(String.UnicodeScalarView(countryCode.unicodeScalars.compactMap {
//            UnicodeScalar(127397 + $0.value)
//        }))
//    }
//}
//
//struct FlagListView_Previews: PreviewProvider {
//    static var previews: some View {
//        FlagListView()
//    }
//}
