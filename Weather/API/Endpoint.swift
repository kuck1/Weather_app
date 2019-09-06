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
//    case fiveDayForecast(city: String)
    case fiveDayForecast(city: String, country: String)
    
//    var baseURL: URL{
//        switch self {
//        case .fiveDayForecast(let city):
//            return URL(string: "base_url?token=\(token)")!
//        }
//    }
//
//    var path:String{
//        switch self {
//        case .fiveDayForecast:
//            return "/api/update-password"
//        }
//    }
    
//    var url: URL? {
//        var components = URLComponents()
//        components.scheme = "http"
//        components.host = "api.openweathermap.org"
//        components.path = "/data/2.5/forecast?q=Atlanta,us&APPID=12667759ba95ef0d8c6f66004a3ac8f3"
//        return components.url
//    }
    
    var baseUrl: String {
        switch self {
        case .fiveDayForecast(let city, let country):
            return "http://api.openweathermap.org/data/2.5/forecast?q=\(city),\(country)&APPID=12667759ba95ef0d8c6f66004a3ac8f3"
            //return "/data/2.5/forecast?q=Atlanta,us&APPID=12667759ba95ef0d8c6f66004a3ac8f3"
        }
    }
    
    var path: String {
        switch self {
            case .fiveDayForecast(let city, let country):
                return ""
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
