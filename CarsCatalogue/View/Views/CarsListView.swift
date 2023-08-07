//
//  CarsListView.swift
//  CarsCatalogue
//
//  Created by Algun Romper  on 03.08.2023.
//

import SwiftUI

struct CarsListView: View {
    @EnvironmentObject var carDetailModelData: CarDetailModelData
    @EnvironmentObject var favoriteCarsModel: FavoriteCarsModel
    @EnvironmentObject var carUserModelData: CarUserModelData
    @EnvironmentObject var carPostsModelData: CarPostsModelData
    
    var cars: [CarDetail] {
        carDetailModelData.carDetail
    }
    
    @State private var isShowingCarDetail = false
    @State private var selectedCar: CarDetail?
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible(minimum: UIScreen.main.bounds.width / 2 - 25), spacing: 10), GridItem(.flexible(minimum: UIScreen.main.bounds.width / 2 - 25), spacing: 5)], spacing: 10) {
                    ForEach(carDetailModelData.carDetail) { car in
                        NavigationLink(destination: CarDetailView(car: car)
                            .environmentObject(carUserModelData)
                            .environmentObject(carPostsModelData)) {
                                CarCell(car: car)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: .infinity)
                            }
                    }
                }
                .foregroundColor(.black)
            }
        }
        .padding()
    }
}

struct CarsListView_Previews: PreviewProvider {
    static var carDetailModelData = CarDetailModelData()
    static var carUserModelData = CarUserModelData()
    static var carPostsModelData = CarPostsModelData()
    static var favoriteCarsModel = FavoriteCarsModel()
    
    static var previews: some View {
        CarsListView()
            .environmentObject(carDetailModelData)
            .environmentObject(carUserModelData)
            .environmentObject(carPostsModelData)
            .environmentObject(favoriteCarsModel)
    }
}
