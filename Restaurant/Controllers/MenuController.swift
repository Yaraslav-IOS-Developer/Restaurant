//
//  MenuController.swift
//  Restaurant
//
//  Created by Yaroslav on 26.01.21.
//

import Foundation


class MenuController {
    
    // MARK: - Properties
    let baseURL  = URL(string: "http://localhost:8080/")
    
    let shared = MenuController()
    
    // MARK: - Private init
    private init() { }
    
    
    // MARK: - Methods
    func fetchCategories(completion: @escaping([String]?)  -> Void) {
        let categoryURL = baseURL?.appendingPathComponent("categories")
        
        let task = URLSession.shared.dataTask(with: categoryURL!) { (data, _, _) in
            
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
        
        let task = URLSession.shared.dataTask(with: baseURL!) { (data, _, _) in
            
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
        
        let task = URLSession.shared.dataTask(with: requst) {data,_,_ in
            
        }

    }
    
}
