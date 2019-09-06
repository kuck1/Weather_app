//
//  Weather.swift
//  Weather
//
//  Created by Ryan Kuck on 9/5/19.
//  Copyright © 2019 Ryan Kuck. All rights reserved.
//

import Foundation

class Weather: Codable {
    let list : List
}


struct List: Codable {
    let main : Main

    private enum CodeingKeys: String, CodingKey {
        case main = "main"
    }
}

struct Main: Codable {
    let temp : Int
    
    private enum CodeingKeys: String, CodingKey {
        case temp = "temp"
    }
}
