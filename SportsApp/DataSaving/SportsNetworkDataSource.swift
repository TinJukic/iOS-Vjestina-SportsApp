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
//    let headers = [
//        "X-RapidAPI-Host": "football-prediction-api.p.rapidapi.com",
//        "X-RapidAPI-Key": "17c1754b1bmsh2e42d8b8558af56p1aa1ebjsn5fcab1dc223c"
//    ]
    let headersSeason = [
        "apikey": "c9ba4d60-e6a4-11ec-9fca-9d1fad038049",
        "season_id": "2020"
    ]
    
    let headersPlayersCroatia = [
        "apikey": "c9ba4d60-e6a4-11ec-9fca-9d1fad038049",
        "country_id": "34"
    ]
    
    init(managedContext: NSManagedObjectContext) {
        self.managedContext = managedContext
        self.sportsDatabaseDataSource = SportsDatabaseDataSource(managedContext: managedContext)
        networkService = NetworkService()
    }
    
    var players: Players?
    func getPlayers(completionHandler: @escaping (_ players: Players?) -> Void) {
        let urlRequestString = "https://app.sportdataapi.com/api/v1/soccer/players?apikey=c9ba4d60-e6a4-11ec-9fca-9d1fad038049&country_id=34"
        guard let url = URL(string: urlRequestString) else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
//        urlRequest.allHTTPHeaderFields = headersPlayersCroatia
        networkService.executeUrlRequest(urlRequest) { (result: Result<Players, RequestError>) in
            switch result {
                case .success(let success):
                print("Podaci za playere su dohvaceni")
                self.players = success
                completionHandler(self.players)
                case .failure(let failure):
                    print("Failure in getPastPerformances, \(failure)")
                }
            }
    }
    
    var standingReq: StandingsReq?
    func getStandings(completionHandler: @escaping (_ standingsReq: StandingsReq) -> Void) {
        let urlRequestString = "https://app.sportdataapi.com/api/v1/soccer/standings?apikey=c9ba4d60-e6a4-11ec-9fca-9d1fad038049&season_id=496"
        guard let url = URL(string: urlRequestString) else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        networkService.executeUrlRequest(urlRequest) { (result: Result<StandingsReq, RequestError>) in
            switch result {
            case .success(let success):
                print("Podaci za standings su dohvaceni")
                self.standingReq = success
                completionHandler(self.standingReq!)
            case .failure(let failure):
                print("Failure in getStandings, \(failure)")
            }
        }
    }
}
