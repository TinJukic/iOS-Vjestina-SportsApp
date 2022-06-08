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

struct StandingsReq: Codable {
    let query: QueryStandings
    let data: Standings
}

struct QueryStandings: Codable {
    let apikey: String
    let seasonId: String
    
    enum CodingKeys: String, CodingKey {
        case apikey
        case seasonId = "season_id"
    }
}

struct Standings: Codable {
    let seasonId: Int64
    let leagueId: Int64
    let hasGroups: Int16
    let standings: [StandingDetails]
    
    enum CodingKeys: String, CodingKey {
        case seasonId = "season_id"
        case leagueId = "league_id"
        case hasGroups = "has_groups"
        case standings
    }
}

struct StandingDetails: Codable {
    let teamId: Int64?
    let points: Int32?
    let status: String?
    let result: String?
    let overall: Overalls
    let home: Overalls
    let away: Overalls
    
    enum CodingKeys: String, CodingKey {
        case teamId = "team_id"
        case points
        case status
        case result
        case overall
        case home
        case away
    }
}

struct Overalls: Codable {
    let gamesPlayed: Int32
    let won: Int32
    let draw: Int32
    let lost: Int32
    let goalsDiff: Int32
    let goalsScored: Int32
    let goalsAgainst: Int32
    
    enum CodingKeys: String, CodingKey {
        case gamesPlayed = "games_played"
        case won
        case draw
        case lost
        case goalsDiff = "goals_diff"
        case goalsScored = "goals_scored"
        case goalsAgainst = "goals_against"
    }
}
