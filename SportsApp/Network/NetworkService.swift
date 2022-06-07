//
//  NetworkService.swift
//  SportsApp
//
//  Created by FIVE on 31.05.2022..
//

import Foundation
import UIKit

class NetworkService {
    func executeUrlRequest<T: Decodable>(_ request: URLRequest, completionHandler: @escaping (Result<T, RequestError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, err in
            guard err == nil else {
                completionHandler(.failure(.clientError))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completionHandler(.failure(.serverError))
                return
            }
            
            guard let data = data else {
                completionHandler(.failure(.noDataError))
                return
            }
            
            var value: T!
            do {
                print(data.first)
                value = try JSONDecoder().decode(T.self, from: data)
            } catch let jsonError as NSError {
                print("JSON ERROR \(jsonError)")
                completionHandler(.failure(.dataDecodingError))
                return
            }
            
            completionHandler(.success(value))
        }
        
        dataTask.resume()
    }
}
