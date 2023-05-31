//
//  GrowingButtonView.swift
//  CountriesCities
//
//  Created by N N on 30/05/2023.
//

import SwiftUI

struct GrowingButtonView: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.tint)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.8 : 1)
            .animation(.easeOut(duration: 0.3), value: configuration.isPressed)
    }
}
