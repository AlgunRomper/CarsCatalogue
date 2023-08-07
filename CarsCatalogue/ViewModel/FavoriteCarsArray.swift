//
//  FavoriteCarsArray.swift
//  CarsCatalogue
//
//  Created by Algun Romper  on 06.08.2023.
//

import Foundation

final class FavoriteCarsModel: ObservableObject {
    @Published var favoriteCars: [CarDetail] = []
    
    func addCar(car: CarDetail) {
        favoriteCars.append(car)
        print(favoriteCars.count)
    }

    func subCar(car: CarDetail) {
        if let index = self.favoriteCars.firstIndex(where: { $0.id == car.id }) {
            self.favoriteCars.remove(at: index)
        }
        print(favoriteCars.count)
    }
    
    func isFavoriteCar(car: CarDetail) -> Bool {
        var isFavorite: Bool
        if favoriteCars.contains(car) {
            isFavorite = true
        } else {
            isFavorite = false
        }
        return isFavorite
    }
}

