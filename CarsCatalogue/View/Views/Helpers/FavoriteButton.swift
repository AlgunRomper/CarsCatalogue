//
//  FavoriteButton.swift
//  CarsCatalogue
//
//  Created by Algun Romper  on 04.08.2023.
//

import SwiftUI

struct FavoriteButton: View {
    var isFavorite: Bool
    var action: () -> Void
    
    var body: some View {
        Button (action: {
            action()
        }, label: {
            Label("Toggle Favorite", systemImage: isFavorite ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isFavorite ? .yellow : .gray)
        })
    }
}
