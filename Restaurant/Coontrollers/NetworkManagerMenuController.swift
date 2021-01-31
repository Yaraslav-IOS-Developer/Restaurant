//
//  NetworkManagerMenuController.swift
//  Restaurant
//
//  Created by Yaroslav on 26.01.21.
//

import Foundation


class NetworkManagerMenuController {
    
    // MARK: - Properties
    let baseURL  = URL(string: "http://localhost:8080/")
    
   static let shared = NetworkManagerMenuController()
    
    // MARK: - Private init
    private init() { }
    
    
    // MARK: - Methods
    func fetchCategories(completion: @escaping([String]?)  -> Void) {
        let categoryURL = baseURL?.appendingPathComponent("categories")
        
        URLSession.shared.dataTask(with: categoryURL!) { (data, _, _) in
            guard let data = data else {
                completion(nil)
                return
            }
            //let categories = try? JSONDecoder().decode(Categories.self, from: data)
            guard let jsonDictionary = try? JSONSerialization.jsonObject(with: data) as?  [String: Any] else {
                completion(nil)
                return
            }
            let categories = jsonDictionary["categories"] as? [String]
            
            completion(categories)
            
        }.resume()
        
        
    }
    
    
    func fetchImage() {
        
    }
    
    
    func fetchMenuItens(forCategory categoryName: String, completion: @escaping([MenuItem]?)  -> Void) {
        let initialMenuURL = baseURL?.appendingPathComponent("menu")
        
        var components = URLComponents(url: initialMenuURL!, resolvingAgainstBaseURL: true)
        components?.queryItems = [
            URLQueryItem(name: "category", value: categoryName)
        ]
        guard let menuURL = components?.url else  {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: menuURL) { (data, _, _) in
            guard let data = data else {
                completion(nil)
                return
            }
            let jsonDecoder = JSONDecoder()
            let menuItems = try? jsonDecoder.decode(MenuItems.self, from: data)
            completion(menuItems?.items)
        }.resume()
        
    }
    
    
    func submitOrder(forMenuIDs munuIds: [Int], completion: @escaping(Int?)  -> Void) {
        let orderURL = baseURL?.appendingPathComponent("order")
        
       var requst = URLRequest(url: orderURL!)
        requst.httpMethod = "POST"
        requst.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let data = ["menuIds": munuIds]
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(data)
        
        requst.httpBody = jsonData
        
        URLSession.shared.dataTask(with: requst) {data,_,_ in
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            let jsonDecoder = JSONDecoder()
            let preparetionTime = try? jsonDecoder.decode(PreparationTime.self, from: data)
            completion(preparetionTime?.prepTime)
            
        }.resume()

    }
    
}
