//
//  Country+CoreDataProperties.swift
//  SportsApp
//
//  Created by FIVE on 08.06.2022..
//
//

import Foundation
import CoreData


extension Country {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Country> {
        return NSFetchRequest<Country>(entityName: "Country")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var countryCode: String?
    @NSManaged public var continent: String?
    @NSManaged public var players: NSSet?

}

// MARK: Generated accessors for players
extension Country {

    @objc(addPlayersObject:)
    @NSManaged public func addToPlayers(_ value: Player)

    @objc(removePlayersObject:)
    @NSManaged public func removeFromPlayers(_ value: Player)

    @objc(addPlayers:)
    @NSManaged public func addToPlayers(_ values: NSSet)

    @objc(removePlayers:)
    @NSManaged public func removeFromPlayers(_ values: NSSet)

}

extension Country : Identifiable {

}
