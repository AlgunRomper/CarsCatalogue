//
//  FavoriteBusket.swift
//  CarsCatalogue
//
//  Created by Algun Romper  on 04.08.2023.
//

import Foundation
import UIKit

final class FavoriteBusket: ObservableObject {
    
    @Published var favoriteBusket: [CarDetail] = []
    
    func addCar(car: CarDetail) {
        self.favoriteBusket.append(car)
    }
    
    func subCar(car: CarDetail) {
        if let index = self.favoriteBusket.firstIndex(where: { $0.id == car.id }) {
        self.favoriteBusket.remove(at: index)
            }
    }
}
