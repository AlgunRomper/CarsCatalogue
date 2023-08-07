//
//  FavoriteRow.swift
//  CarsCatalogue
//
//  Created by Algun Romper  on 04.08.2023.
//

import SwiftUI

struct FavoriteRow: View {
    @EnvironmentObject var favoriteBusket: FavoriteBusket
    
    var car: CarDetail
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: car.image ?? "")) { loadedImage in
                loadedImage.resizable()
                    .scaledToFill()
                    .clipped()
            } placeholder: {
                ProgressView()
            }
            Text(car.name)
            
            Spacer()
            
            if car.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}
//
//struct FavoriteRow_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoriteRow(car: CarDetailModelData().carDetail[0])
//            .previewLayout(.fixed(width: 300, height: 70))
//    }
//}
