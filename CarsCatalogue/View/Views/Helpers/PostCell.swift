//
//  PostCell.swift
//  CarsCatalogue
//
//  Created by Algun Romper  on 04.08.2023.
//

import SwiftUI

struct PostCell: View {
    var post: CarPosts
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if post.img != nil {
                AsyncImage(url: URL(string: post.img ?? "")) { loadedImage in
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
            VStack(alignment: .leading) {
                Text(post.created_at)
                    .font(.system(size: 10))
                    .bold()
                    .padding(.top, 5)
                    .padding(.leading, 0)
                    .padding(.bottom, 5)
                Text(post.text ?? "")
                    .lineLimit(5)
                    .font(.system(size: 10))
                    .bold()
                    .padding(.top, 5)
                    .padding(.leading, 0)
                    .padding(.bottom, 5)
                HStack {
                    Image(systemName: "heart")
                    Text(String(post.like_count ?? 0))
                    Image(systemName: "text.bubble")
                    Text(String(post.comment_count ?? 0))
                }
            }
            .foregroundColor(.black)
        }
        .cornerRadius(10)
        .padding(5)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
    }
}
