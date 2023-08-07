//
//  FavoriteCarRow.swift
//  CarsCatalogue
//
//  Created by Algun Romper  on 06.08.2023.
//

import SwiftUI

struct FavoriteCarRow: View {
    var car: CarDetail
    
    var body: some View {
        HStack {
            if car.image != nil {
                AsyncImage(url: URL(string: car.image ?? "")) { loadedImage in
                    loadedImage.resizable()
                        .frame(width: 50, height: 50)
                }
                placeholder: {
                    ProgressView()
                }
            }
                
            Text(car.name)
            
            Spacer()
        }
    }
}
