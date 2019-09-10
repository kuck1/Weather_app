//
//  APIClient.swift
//  Weather
//
//  Created by Ryan Kuck on 9/5/19.
//  Copyright © 2019 Ryan Kuck. All rights reserved.
//

import Foundation

enum Either<V, E: Error> {
    case value(V)
    case error(E)
}

enum APIError: Error {
    case apiError
    case badResponse
    case jsonDecoder
    case unknown(String)
}

protocol APIClient {
    var session : URLSession {get}
    func fetch<V: Codable> (with request: URLRequest, completion: @escaping (Either<V, APIError>) -> Void)
}


extension APIClient {
    func fetch<V: Codable> (with request: URLRequest, completion: @escaping (Either<V, APIError>) -> Void){
        let task = session.dataTask(with: request) { (data, response, error) in
            guard error == nil else  {
                completion(.error(.apiError))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                print(response)
                return
            }
            guard httpResponse.statusCode == 200 else {
                print(httpResponse.statusCode)
                print(response)
                completion(.error(.badResponse))
                return
            }
//            guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
//                completion(.error(.badResponse))
//                return
//            }
//            var jsonObject
//
//            do {
//                let jsonObject = try JSONSerialization.jsonObject(with: data!, options: [])
//                print(JSONSerialization.isValidJSONObject(jsonObject))
//            }
//            catch{}
            print("howdy")

            do {
                let dictionaryFromJSON = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
                print("y")

                let jsonItem = dictionaryFromJSON["list"] as? NSArray
                print("yee")
                
                let jsonData = try JSONSerialization.data(withJSONObject: jsonItem!, options: [])
                print("yee h")
                
    //                let convertedString = String(data: jsonData, encoding: String.Encoding.utf8) // the data will be converted to the string
    //                print(convertedString!) // <-- here is ur string
                let responseModel = try JSONDecoder().decode([List].self, from: jsonData)
    //                print(responseModel)
    //                print("yee haw")
        
    //            guard let value = try? JSONDecoder().decode(V.self, from: jsonObject as! Data) else {
    ////                let jsonObject = try? JSONSerialization.jsonObject(with: data!, options: [])
    ////                print(JSONSerialization.isValidJSONObject(jsonObject))
    ////                completion(.error(.jsonDecoder))
    //                print("greetings")
    //                return
    //            }
                completion(.value(responseModel))
            }
            catch {
                print("darn")
                print(error)
                completion(.error(.jsonDecoder))
            }
        }
        task.resume()
    }
}
