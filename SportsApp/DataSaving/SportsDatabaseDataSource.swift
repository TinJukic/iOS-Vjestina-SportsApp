//
//  SportsDatabaseDataSource.swift
//  SportsApp
//
//  Created by FIVE on 31.05.2022..
//

import Foundation
import UIKit
import CoreData

class SportsDatabaseDataSource {
    var managedContext: NSManagedObjectContext!
    
    init(managedContext: NSManagedObjectContext) {
        self.managedContext = managedContext
    }
    
    func savePlayers(players: Players?) {
        // ovdje spremam igrace
        do {
            try players?.data.forEach({ player in
                let playerInDatabase = fetchPlayer(withId: Int64(player.playerId!))
                
                if(playerInDatabase != nil) {
                    updatePlayer(playerDetails: player, player: playerInDatabase!)
                } else {
                    _ = savePlayer(player: player)
                }
                
                try managedContext.save()
            })
        } catch let error as NSError {
            print("Error \(error): \(error.userInfo)")
        }
    }
    
    func fetchPlayers() -> [Player] {
        let request: NSFetchRequest<Player> = Player.fetchRequest()
        let lastNameSort = NSSortDescriptor(key: "lastName", ascending: true)
        let firstNameSort = NSSortDescriptor(key: "firstName", ascending: true)
        request.sortDescriptors = [lastNameSort, firstNameSort]
        
        do {
            return try managedContext.fetch(request)
        } catch let error as NSError {
            print("Error \(error): \(error.userInfo)")
            return []
        }
    }
    
    func searchPlayers(lastName: String) -> [Player] {
        let request: NSFetchRequest<Player> = Player.fetchRequest()
        let predicate = NSPredicate(format: "lastName CONTAINS %@", "\(lastName)")
        request.predicate = predicate
        
        let nameSort = NSSortDescriptor(key: "firstName", ascending: true)
        request.sortDescriptors = [nameSort]
        
        do {
            return try managedContext.fetch(request)
        } catch let error as NSError {
            print("Error \(error): \(error.userInfo)")
            return []
        }
    }
    
    func fetchPlayer(withId id: Int64) -> Player? {
        let request: NSFetchRequest<Player> = Player.fetchRequest()
        let predicate = NSPredicate(format: "playerId = %@", "\(id)")
        request.predicate = predicate
        request.fetchLimit = 1
        
        do {
            return try managedContext.fetch(request).first
        } catch let error as NSError {
            print("Error \(error): \(error.userInfo)")
            return nil
        }
    }
    
    func savePlayer(player: PlayerDeatails) -> Player {
        let newPlayer = Player(context: self.managedContext)
        
        newPlayer.playerId = Int64(player.playerId!)
        newPlayer.firstName = player.firstName ?? "firstName"
        newPlayer.lastName = player.lastName ?? "lastName"
        newPlayer.age = Int16(player.age ?? -1)
        newPlayer.birthday = player.birthday
        newPlayer.img = player.img
        newPlayer.weight = Int32(player.weight ?? -1)
        newPlayer.height = Int32(player.height ?? -1)
        newPlayer.country = saveCountry(country: player.country)
        
        return newPlayer
    }
    
    func updatePlayer(playerDetails: PlayerDeatails, player: Player) {
        player.firstName = playerDetails.firstName ?? "firstName"
        player.lastName = playerDetails.lastName ?? "lastName"
        player.height = Int32(playerDetails.height ?? -1)
        player.weight = Int32(playerDetails.weight ?? -1)
        player.age = Int16(playerDetails.age ?? -1)
        player.birthday = playerDetails.birthday
        player.country = updateCountry(countryDetails: playerDetails.country, country: player.country!)
    }
    
    func saveCountry(country: PlayerCountry) -> Country {
        let newCountry = Country(context: managedContext)
        
        newCountry.id = Int64(country.countryId)
        newCountry.name = country.name
        newCountry.continent = country.continent
        newCountry.countryCode = country.countryCode
        
        return newCountry
    }
    
    func updateCountry(countryDetails: PlayerCountry, country: Country) -> Country {
        country.name = countryDetails.name
        country.continent = countryDetails.continent
        country.countryCode = countryDetails.countryCode
        country.id = Int64(countryDetails.countryId)
        
        return country
    }
}
