//
//  Structs.swift
//  SportsApp
//
//  Created by FIVE on 01.06.2022..
//

import Foundation
import UIKit

// API KEY: 17c1754b1bmsh2e42d8b8558af56p1aa1ebjsn5fcab1dc223c
// Croatia: 34

struct QueryPlayer: Codable {
    let apikey: String
    let countryId: String?
    
    enum CodingKeys: String, CodingKey {
        case apikey
        case countryId = "country_id"
    }
}

struct Players: Codable {
    let query: QueryPlayer
    let data: [PlayerDeatails]
}

struct PlayerDeatails: Codable {
    let playerId: Int?
    let firstName: String?
    let lastName: String?
    let birthday: String?
    let age: Int?
    let weight: Int?
    let height: Int?
    let img: String?
    let country: PlayerCountry
    
    enum CodingKeys: String, CodingKey {
        case playerId = "player_id"
        case firstName = "firstname"
        case lastName = "lastname"
        case birthday
        case age
        case weight
        case height
        case img
        case country
    }
}

struct PlayerCountry: Codable {
    let countryId: Int
    let name: String
    let countryCode: String
    let continent: String
    
    enum CodingKeys: String, CodingKey {
        case countryId = "country_id"
        case name
        case countryCode = "country_code"
        case continent
    }
}

//struct PlayerInfo: Codable {
//    let query: QueryPlayer
//    let data: Player
//}

struct Matches: Codable {
    let data: [Match]
}

struct Match: Codable {
    let matchData: [String : [Match]]
}

struct PastPerformances: Codable {
    let data: [String : [PastPerformance]]
}

struct PastPerformance: Codable {
    let accuracy: [Accuracy]
    let details:  [LastDays]
    let market: String?
}

struct Accuracy: Codable {
    let last14Days: Int
    let last30Days: Int
    let last7Days: Int
    let yesterday: Int
    
    enum CodingKeys: String, CodingKey {
        case last14Days = "last_14_days"
        case last30Days = "last_30_days"
        case last7Days = "last_7_days"
        case yesterday
    }
}

struct LastDays: Codable {
    let lost: Int
    let pending: Int
    let postponed: Int
    let total: Int
    let won: Int
}

struct IDs: Codable {
    let ids: [ID]
}

struct ID: Codable {
    let index: Int
    let ID: Int
}

struct HomeTeamStatsList: Codable {
    let homeTeamStats: [HomeTeamStats]
}

struct HomeTeamStats: Codable {
    let matchesPlayed: Int
    let lost: Int
    let wonAsHomeTeam: Int
    let lostAsHomeTeam: Int
    let drawAsHomeTeam: Int
    let goalsConceived: Int
    let pointsAsHomeTeam: Int
    let won: Int
    let team: String
    let goalsScoredAsHomeTeam: Int
    let goalsConceivedAsHomeTeam: Int
    let draw: Int
    let goalsScored: Int
    let points: Int
    let matchesPlayedAsHomeTeam: Int
    
    enum CodingKeys: String, CodingKey {
        case matchesPlayed = "matches_played"
        case lost
        case wonAsHomeTeam = "won_as_home_team"
        case lostAsHomeTeam = "lost_as-home_team"
        case drawAsHomeTeam = "draw_as_home_team"
        case goalsConceived = "goals_conceived"
        case pointsAsHomeTeam = "points_as_home_team"
        case won
        case team
        case goalsScoredAsHomeTeam = "goals_scored_as_home_team"
        case goalsConceivedAsHomeTeam = "goal_conceived_as_home_team"
        case draw
        case goalsScored = "goals_scored"
        case points
        case matchesPlayedAsHomeTeam = "matches_played_as_home_team"
    }
}
