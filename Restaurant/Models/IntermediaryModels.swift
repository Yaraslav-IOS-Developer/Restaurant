//
//  IntermediaryModels.swift
//  Restaurant
//
//  Created by Yaroslav on 26.01.21.
//




struct Categories: Codable {
    
    let categories: [String]
}


struct PreparationTime: Codable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
        
    }
}
