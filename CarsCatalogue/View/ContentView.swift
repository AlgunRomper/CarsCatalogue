//
//  ContentView.swift
//  CarsCatalogue
//
//  Created by Algun Romper  on 03.08.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .list
    
    enum Tab: String {
        case list = "List"
        case favorite = "Favorite"
    }
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                CarsListView()
                    .tabItem {
                        Label("Главная", systemImage: "list.bullet")
                    }
                    .tag(Tab.list)
                
                FavoriteCarsView()
                    .tabItem {
                        Label("Избранное", systemImage: "star")
                    }
                    .tag(Tab.favorite)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CarDetailModelData())
            .environmentObject(CarUserModelData())
            .environmentObject(CarPostsModelData())
            .environmentObject(FavoriteCarsModel())
    }
}
