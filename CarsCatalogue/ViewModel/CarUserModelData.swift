//
//  CarDetailModelData.swift
//  CarsCatalogue
//
//  Created by Algun Romper  on 03.08.2023.
//

import Foundation
import UIKit

final class CarUserModelData: ObservableObject {
    @Published var carUser: CarUser?
    @Published var selectedCarIndex: Int?

    init() {
        selectedCarIndex = nil
        carUser = nil
        loadCarUserData()
    }

    func loadCarUserData() {
        if let carIndex = selectedCarIndex {
            let urlString = "http://am111.05.testing.place/api/v1/car/\(String(describing: carIndex))"
            
            guard let url = URL(string: urlString) else {
                fatalError("Invalid URL")
            }
            
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                guard let data = data, error == nil else {
                    DispatchQueue.main.async {
                        // Обработка ошибки
                        print("error")
                    }
                    return
                }
               
                do {
                    if let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                        // Получаем объект CarUser из словаря
                        if let carUserDict = jsonObject["user"] as? [String: Any] {
                            // Декодируем CarUser из словаря
                            let decoder = JSONDecoder()
                            let carUserJSONData = try JSONSerialization.data(withJSONObject: carUserDict)
                            let carUser = try decoder.decode(CarUser.self, from: carUserJSONData)
                            
                            DispatchQueue.main.async {
                                self?.carUser = carUser
                                if let image_UrlString = self?.carUser?.avatar.url,
                                   let image_Url = URL(string: image_UrlString) {
                                    self?.loadImage(from: image_Url) { loadedImage in
                                        DispatchQueue.main.async {
                                            self?.carUser?.loadedAvatar = loadedImage
                                        }
                                    }
                                }
                            }
                        }
                    }
                } catch {
                    DispatchQueue.main.async {
                        // Обработка ошибки
                        print("Error during decoding:", error)
                        print("error2")
                    }
                }
            }.resume()
        }
    }

    
    func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
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

