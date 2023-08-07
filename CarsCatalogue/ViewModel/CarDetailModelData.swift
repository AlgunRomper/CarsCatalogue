//
//  CarsListModelData.swift
//  CarsCatalogue
//
//  Created by Algun Romper  on 03.08.2023.
//

import Foundation
import UIKit

final class CarDetailModelData: ObservableObject {
    @Published var carDetail: [CarDetail] = []
    
    init() {
        loadCarDetailData()
    }
    
    func loadCarDetailData() {
        
        guard let url = URL(string: "http://am111.05.testing.place/api/v1/cars/list") else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if data == data, let response = response as? HTTPURLResponse {
                print("Response status code: \(response.statusCode)")
            }
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    // Обработка ошибки
                    print("error")
                }
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let carDetail = try decoder.decode([CarDetail].self, from: data)
                
                DispatchQueue.main.async {
                    self?.carDetail = carDetail
                    
                    for i in 0..<carDetail.count {
                        if let image_UrlString = carDetail[i].image,
                           let image_Url = URL(string: image_UrlString) {
                            self?.loadImage(from: image_Url) { loadedImage in
                                DispatchQueue.main.async {
                                    self?.carDetail[i].loadedImage = loadedImage
                                }
                            }
                        }
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    // Обработка ошибки
                    print("error2")
                }
            }
        }.resume()
    }
    
    
    func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        print("loadImage")
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let loadedImage = UIImage(data: data)
            completion(loadedImage)
        }.resume()
    }
}
