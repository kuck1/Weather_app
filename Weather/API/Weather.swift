//
//  Weather.swift
//  Weather
//
//  Created by Ryan Kuck on 9/5/19.
//  Copyright © 2019 Ryan Kuck. All rights reserved.
//

import Foundation

//class Weather: Codable {
//    let weather : Weather1
//}
//
//struct Weather1: Codable {
//    let id : Int
//    let main : String
//    let description : String
//    let icon : String
//
//    private enum CodeingKeys: String, CodingKey {
//        case id = "id"
//        case main = "main"
//        case description = "description"
//        case icon = "icon"
//    }
//}


class Weather: Codable {
    let list : List1
}

//struct List1: Codable {
//    let array : ArrayData
//}

struct List1: Codable {
    let dt : Int?
    let main : Main?
    let weather : [Weather1]
    let clouds : Clouds?
    let wind : Wind?
    let rain : Rain?
    let sys : Sys?
    let dt_txt : String?

    private enum CodeingKeys: String, CodingKey {
        case clouds = "clouds"
    }
}

struct Main: Codable {
    let temp : Decimal
    let temp_min : Decimal
    let temp_max : Decimal
    let pressure : Decimal
    let sea_level : Decimal
    let grnd_level : Decimal
    let humidity : Int
    let temp_kf : Decimal
}

struct Weather1: Codable {
        let id : Int
        let main : String
        let description : String
        let icon : String
}

struct Clouds: Codable {
    let all : Int
}

struct Wind: Codable {
    let speed : Decimal
    let deg : Decimal
}

struct Rain: Codable {
    let three_hour : Decimal?
    private enum CodeingKeys: String, CodingKey {
        case three_hour = "3h"
    }
}

struct Sys: Codable {
    let pod : String
}
