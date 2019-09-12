//
//  WeatherAPIClient.swift
//  Weather
//
//  Created by Ryan Kuck on 9/5/19.
//  Copyright © 2019 Ryan Kuck. All rights reserved.
//

import Foundation

class WeatherAPIClient: APIClient {
    var session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func weather(with endpoint: WeatherEndpoint, completion: @escaping (Either<List1, APIError>) -> Void){
        let request = endpoint.request
        self.fetch(with: request) { (either: Either<List1, APIError>) in
            switch either {
            case .value(let weather):
                completion(.value(weather))
            case .error(let error):
                completion(.error(error))
            }
        }
    }
}
