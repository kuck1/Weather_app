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
    
    var urlCorrect: String {
        return "http://api.openweathermap.org/data/2.5/forecast?q=Atlanta,us&APPID=12667759ba95ef0d8c6f66004a3ac8f3"
    }

    var request: URLRequest {
        var urlCompCorrect = URLComponents(string: urlCorrect)!
        print(urlCompCorrect.url!)
        print("hi")
        return URLRequest(url: urlCompCorrect.url!)
//        return URLRequest(url: urlComponent.url!)
    }
    
}

enum WeatherEndpoint: Endpoint {
    
//    case tenDayForecast(city: String, state: String)
//    case fiveDayForecast(city: String)
    case fiveDayForecast(city: String, country: String)
    
    var baseUrl: String {
        switch self {
        case .fiveDayForecast(let city, let country):
            return "http://api.openweathermap.org/"
            //return "/data/2.5/forecast?q=Atlanta,us&APPID=12667759ba95ef0d8c6f66004a3ac8f3"
        }
    }
    
    var path: String {
        switch self {
            case .fiveDayForecast(let city, let country):
//                let urlComp = URLComponents(string: "/data/2.5/weather?q=\(city),\(country)&APPID=12667759ba95ef0d8c6f66004a3ac8f3")!
            
                return "/data/2.5/weather?q=\(city),\(country)&APPID=12667759ba95ef0d8c6f66004a3ac8f3"
                //return "/data/2.5/forecast?q=Atlanta,us&APPID=12667759ba95ef0d8c6f66004a3ac8f3"
        }
    
        
//        case .fiveDayForecast(let city, let country):
//            return "/data/2.5/forecast?q=\(city),\(country)&APPID=12667759ba95ef0d8c6f66004a3ac8f3"
//        }
//        case .tenDayForecast(let city, let state):
//            return "/api/c6bb6d63e8547b6e/forecast10day/q/\(state)/\(city).json"
//        }
    }
    
    var queryItems: [URLQueryItem] {
        return []
    }
}
