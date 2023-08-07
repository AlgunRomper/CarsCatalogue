//
//  CircleImageUser.swift
//  CarsCatalogue
//
//  Created by Algun Romper  on 06.08.2023.
//

import SwiftUI

struct CircleImageUser: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .frame(width: 35, height: 35)
            .clipShape(Circle())
    }
}
