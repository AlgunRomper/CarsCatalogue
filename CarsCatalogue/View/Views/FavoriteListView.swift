//
//  FavoriteListView.swift
//  CarsCatalogue
//
//  Created by Algun Romper  on 04.08.2023.
//

import SwiftUI

struct FavoriteListView: View {
    @EnvironmentObject var favoriteBusket: FavoriteBusket
    
    var body: some View {
        NavigationView {
            ForEach(Array(favoriteBusket.favoriteBusket
                .reduce(into: [String: CarDetail]()) { result, car in
                    result[car.name] = car
                }
                .values)) { car in
                    NavigationLink(destination: CarDetailView(car: car)) {
                        FavoriteRow(favoriteBusket: _favoriteBusket, car: car)
                    }
                }
        }
    }
}
//
//struct FavoriteListView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoriteListView()
//    }
//}
