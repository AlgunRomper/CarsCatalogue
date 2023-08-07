//
//  CarCell.swift
//  CarsCatalogue
//
//  Created by Algun Romper  on 03.08.2023.
//

import SwiftUI

struct CarCell: View {
    var car: CarDetail
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if car.image != nil {
                AsyncImage(url: URL(string: car.image ?? "")) { loadedImage in
                    loadedImage.resizable()
                        .scaledToFill()
                        .clipped()
                } placeholder: {
                    ProgressView()
                }
                .padding(.top, -5)
                .padding(.leading, -5)
                .padding(.trailing, -5)
            }
            Text(car.name)
                .font(.system(size: 10))
                .bold()
                .padding(.top, 5)
                .padding(.leading, 0)
                .padding(.bottom, 5)
        }
        .cornerRadius(10)
        .padding(5)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
    }
}
