//
//  SportsNetworkDataSource.swift
//  SportsApp
//
//  Created by FIVE on 31.05.2022..
//

import Foundation
import UIKit
import CoreData

// 17c1754b1bmsh2e42d8b8558af56p1aa1ebjsn5fcab1dc223c

class SportsNetworkDataSource {
    var networkService: NetworkService!
    var sportsDatabaseDataSource: SportsDatabaseDataSource!
    var managedContext: NSManagedObjectContext!
    let headers = [
        "X-RapidAPI-Host": "football-prediction-api.p.rapidapi.com",
        "X-RapidAPI-Key": "17c1754b1bmsh2e42d8b8558af56p1aa1ebjsn5fcab1dc223c"
    ]
    
    init(managedContext: NSManagedObjectContext) {
        self.managedContext = managedContext
        self.sportsDatabaseDataSource = SportsDatabaseDataSource(managedContext: managedContext)
        networkService = NetworkService()
    }
    
    var pastPerformances: PastPerformances?
    func getPastPerformances(completionHandler: @escaping (_ pastPerformances: PastPerformances?) -> Void) {
        let urlRequestString = "https://football-prediction-api.p.rapidapi.com/api/v2/performance-stats?market=classic"
        guard let url = URL(string: urlRequestString) else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = headers
        networkService.executeUrlRequest(urlRequest) { (result: Result<PastPerformances, RequestError>) in
            switch result {
            case .success(let success):
                print("Podaci su dohvaceni")
                self.pastPerformances = success
                completionHandler(self.pastPerformances)
            case .failure(let failure):
                print("Failure in getPastPerformances, \(failure)")
            }
        }
    }
}
