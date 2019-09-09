//
//  Weather.swift
//  Weather
//
//  Created by Ryan Kuck on 9/5/19.
//  Copyright © 2019 Ryan Kuck. All rights reserved.
//

import Foundation

class Weather: Codable {
    let weather : Weather1
}

struct Base: Codable {
    let base : String
}


struct Weather1: Codable {
    let id : Int
    let main : String
    let description : String
    let icon : String
    
    private enum CodeingKeys: String, CodingKey {
        case id = "id"
        case main = "main"
        case description = "description"
        case icon = "icon"
    }
}


//class Weather: Codable {
//    let list : List
//}
//
//
//struct List: Codable {
//    let main : Main
//
//    private enum CodeingKeys: String, CodingKey {
//        case main = "main"
//    }
//}
//
//struct Main: Codable {
//    let temp : Int
//
//    private enum CodeingKeys: String, CodingKey {
//        case temp = "temp"
//    }
//}
