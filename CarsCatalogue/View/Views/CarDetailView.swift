//
//  CarDetail.swift
//  CarsCatalogue
//
//  Created by Algun Romper  on 03.08.2023.
//

import SwiftUI

struct CarDetailView: View {
    @EnvironmentObject var carDetailModelData: CarDetailModelData
    @EnvironmentObject var carUserModelData: CarUserModelData
    @EnvironmentObject var carPostsModelData: CarPostsModelData
    @EnvironmentObject var favoriteCarsModel: FavoriteCarsModel
    
    var car: CarDetail
    
    var carPosts: [CarPosts] {
        carPostsModelData.carPosts
    }
    
    var carIndex: Int? {
        car.id
    }
    
    var isFavorite: Bool {
        favoriteCarsModel.isFavoriteCar(car: car)
    }
    
    @State private var isLoadingMorePosts = false
    
    var body: some View {
        VStack {
            ScrollViewReader { scrollView in
                ScrollView {
                    HStack {
                        //Здесь фото машины
                        if car.image != nil {
                            AsyncImage(url: URL(string: car.image ?? "")) { loadedImage in
                                loadedImage.resizable()
                                    .scaledToFill()
                                    .aspectRatio(contentMode: .fit)
                                    .clipped()
                                    .cornerRadius(5)
                            }
                        placeholder: {
                            ProgressView()
                        }
                        }
                        
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Spacer()
                                //Кнопка для добавления в избранное
                                FavoriteButton(isFavorite: favoriteCarsModel.isFavoriteCar(car: car)) {
                                    isFavorite ? favoriteCarsModel.subCar(car: car) : favoriteCarsModel.addCar(car: car)
                                }
                            }
                            
                            //Здесь информация о машине
                            Text(car.brand_name + " " + car.model_name)
                                .font(.system(size: 15))
                                .padding()
                                .bold()
                            HStack {
                                Text(car.engine_volume + " " + car.engine_name)
                                    .font(.system(size: 15))
                                    .padding()
                                Text(car.transmission_name + " " + String(car.year))
                                    .font(.system(size: 15))
                                    .padding()
                            }
                            //Здесь информация о пользователе
                            HStack {
                                CircleImageUser(image: Image(uiImage: carUserModelData.carUser?.loadedAvatar ?? UIImage()))
                                Text(carUserModelData.carUser?.username ?? "")
                                    .font(.system(size: 10))
                                    .padding()
                                    .bold()
                            }
                            .padding()
                        }
                    }
                    
                    //здесь список статей о машине
                    LazyVStack {
                                    ForEach(carPosts.indices, id: \.self) { index in
                                        let post = carPosts[index]
                                        Button(action: {}) {
                                            PostCell(post: post)
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: .infinity)
                                                .id(post.id) // для ScrollViewReader
                                                .onAppear {
                                                    if index == carPosts.count - 1 && !isLoadingMorePosts {
                                                        isLoadingMorePosts = true
                                                        carPostsModelData.loadMorePostsData {
                                                            isLoadingMorePosts = false
                                                            scrollView.scrollTo(carPosts.last?.id, anchor: .bottom)
                                                        }
                                                    }
                                                }
                                        }
                        }
                        // Очистка данных о постах при выходе из view
                        .onDisappear {
                            carPostsModelData.carPosts.removeAll()
                        }
                    }
                }
            }
            
            //это для загрузки данных
            .onAppear {
                carUserModelData.selectedCarIndex = carIndex
                carUserModelData.loadCarUserData()
                carPostsModelData.selectedCarIndex = carIndex
                carPostsModelData.loadCarPostsData()
            }
            .onReceive(NotificationCenter.default.publisher(for: Notification.Name("LoadMorePosts"))) { _ in

            }
        }
    }
}
