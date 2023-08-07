//
//  FavoriteCarsView.swift
//  CarsCatalogue
//
//  Created by Algun Romper  on 06.08.2023.
//

import SwiftUI

struct FavoriteCarsView: View {
    @EnvironmentObject var favoriteCarsModel: FavoriteCarsModel
    
    var body: some View {
        NavigationView {
            List(favoriteCarsModel.favoriteCars) { car in
                NavigationLink (destination: CarDetailView(car: car)) {
                    FavoriteCarRow(car: car)
                }
            }
            .navigationTitle("Избранное")
        }
    }
}
