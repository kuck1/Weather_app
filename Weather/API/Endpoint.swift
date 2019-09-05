//
//  Endpoint.swift
//  Weather
//
//  Created by Ryan Kuck on 9/5/19.
//  Copyright © 2019 Ryan Kuck. All rights reserved.
//

import Foundation

protocol Endpoint {
    var baseUrl: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
}

extension Endpoint {
    var urlComponent: URLComponents {
        var component = URLComponents(string: baseUrl)
        component?.path = path
        component?.queryItems = queryItems
        
        return component!
    }
    
    var request: URLRequest {
        return URLRequest(url: urlComponent.url!)
    }
}

enum WeatherEndpoint: Endpoint {
//    case tenDayForecast(city: String, state: String)
    case fiveDayForecast(city: String, country: String)
    var baseUrl: String {
        return "https://api.openweathermap.org"
    }
    
    var path: String {
        switch self {
        case .fiveDayForecast(let city, let country):
            return "/data/2.5/forecast?q=\(city),\(country)&APPID=12667759ba95ef0d8c6f66004a3ac8f3"
        }
//        case .tenDayForecast(let city, let state):
//            return "/api/c6bb6d63e8547b6e/forecast10day/q/\(state)/\(city).json"
//        }
    }
    
    var queryItems: [URLQueryItem] {
        return []
    }
}
