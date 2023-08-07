//
//  CarsCatalogueApp.swift
//  CarsCatalogue
//
//  Created by Algun Romper  on 03.08.2023.
//

import SwiftUI

@main
struct CarsCatalogueApp: App {
    @StateObject private var carDetailModelData = CarDetailModelData()
    @StateObject private var favoriteCarsModelData = FavoriteCarsModel()
    @StateObject private var carUserModelData = CarUserModelData()
    @StateObject private var carPostsModelData = CarPostsModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(carDetailModelData)
                .environmentObject(favoriteCarsModelData)
                .environmentObject(carUserModelData)
                .environmentObject(carPostsModelData)
        }
    }
}
