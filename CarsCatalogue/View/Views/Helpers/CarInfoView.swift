//
//  CarInfoView.swift
//  CarsCatalogue
//
//  Created by Algun Romper  on 06.08.2023.
//

import SwiftUI

struct CarInfoView: View {
    
    var car: CarDetail
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if let brandName = car.brand_name, let modelName = car.model_name {
                Text((car.brand_name ?? "") + " " + (car.model_name ?? ""))
                    .font(.system(size: 15))
                    .padding()
                    .bold()
            }
            HStack {
                if let engineVolume = car.engine_volume, let engineName = car.engine_name {
                    Text((car.engine_volume ?? "") + " " + (car.engine_name ?? ""))
                        .font(.system(size: 15))
                        .padding()
                }
                if let transmissionName = car.transmission_name, let year = car.year {
                    Text((car.transmission_name ?? "") + " " + (String(car.year) ?? 0))
                        .font(.system(size: 15))
                        .padding()
                }
            }
        }
    }
}
//
//struct CarInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        CarInfoView()
//    }
//}
