//
//  CarPostsModelData.swift
//  CarsCatalogue
//
//  Created by Algun Romper  on 03.08.2023.
//

import Foundation
import UIKit

final class CarPostsModelData: ObservableObject {
    @Published var carPosts: [CarPosts] = []
    @Published var selectedCarIndex: Int?
    
    @Published var isLoadingMorePosts = false
    
    init() {
        loadCarPostsData()
    }

    func loadCarPostsData() {
        if let carIndex = selectedCarIndex {
            let urlString = "http://am111.05.testing.place/api/v1/car/\(String(describing: carIndex))/posts"
            
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
                // Вывести данные на консоль если ошибка
//                            if let jsonString = String(data: data, encoding: .utf8) {
//                                print(jsonString)
//                            }
                
                
                do {
                    let decoder = JSONDecoder()
                        let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                        
                        if let postsDict = jsonObject?["posts"] as? [[String: Any]] {
                            let postData = try JSONSerialization.data(withJSONObject: postsDict, options: [])
                            let newPosts = try decoder.decode([CarPosts].self, from: postData)
                    
                    DispatchQueue.main.async {
                        self?.carPosts.append(contentsOf: newPosts)
                            
                        for (index, post) in newPosts.enumerated() {
                                if let image_UrlString = post.img,
                                   let image_Url = URL(string: image_UrlString) {
                                    self?.loadImage(from: image_Url) { loadedImage in
                                        DispatchQueue.main.async {
                                            self?.carPosts[index].loadedImage = loadedImage
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
    
    func loadMorePostsData(completion: @escaping () -> Void) {
        if let carIndex = selectedCarIndex {
            let urlString = "http://am111.05.testing.place/api/v1/car/\(String(describing: carIndex))/posts"
            
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
                // Вывести данные на консоль если ошибка
//                            if let jsonString = String(data: data, encoding: .utf8) {
//                                print(jsonString)
//                            }
                
                
                do {
                    let decoder = JSONDecoder()
                        let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                        
                        if let postsDict = jsonObject?["posts"] as? [[String: Any]] {
                            let postData = try JSONSerialization.data(withJSONObject: postsDict, options: [])
                            let newPosts = try decoder.decode([CarPosts].self, from: postData)
                    
                    DispatchQueue.main.async {
                        self?.carPosts.append(contentsOf: newPosts)
                        NotificationCenter.default.post(name: Notification.Name("LoadMorePosts"), object: nil)
                                        completion()
                        
                        for (index, post) in newPosts.enumerated() {
                                if let image_UrlString = post.img,
                                   let image_Url = URL(string: image_UrlString) {
                                    self?.loadImage(from: image_Url) { loadedImage in
                                        DispatchQueue.main.async {
                                            self?.carPosts[index].loadedImage = loadedImage
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
}



