//
//  Overall+CoreDataProperties.swift
//  SportsApp
//
//  Created by FIVE on 08.06.2022..
//
//

import Foundation
import CoreData


extension Overall {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Overall> {
        return NSFetchRequest<Overall>(entityName: "Overall")
    }

    @NSManaged public var gamesPlayed: Int32
    @NSManaged public var won: Int32
    @NSManaged public var draw: Int32
    @NSManaged public var lost: Int32
    @NSManaged public var goalsDiff: Int32
    @NSManaged public var goalsScored: Int32
    @NSManaged public var goalsAgainst: Int32
    @NSManaged public var overall: NSSet?
    @NSManaged public var home: NSSet?
    @NSManaged public var away: NSSet?

}

// MARK: Generated accessors for overall
extension Overall {

    @objc(addOverallObject:)
    @NSManaged public func addToOverall(_ value: Standing)

    @objc(removeOverallObject:)
    @NSManaged public func removeFromOverall(_ value: Standing)

    @objc(addOverall:)
    @NSManaged public func addToOverall(_ values: NSSet)

    @objc(removeOverall:)
    @NSManaged public func removeFromOverall(_ values: NSSet)

}

// MARK: Generated accessors for home
extension Overall {

    @objc(addHomeObject:)
    @NSManaged public func addToHome(_ value: Standing)

    @objc(removeHomeObject:)
    @NSManaged public func removeFromHome(_ value: Standing)

    @objc(addHome:)
    @NSManaged public func addToHome(_ values: NSSet)

    @objc(removeHome:)
    @NSManaged public func removeFromHome(_ values: NSSet)

}

// MARK: Generated accessors for away
extension Overall {

    @objc(addAwayObject:)
    @NSManaged public func addToAway(_ value: Standing)

    @objc(removeAwayObject:)
    @NSManaged public func removeFromAway(_ value: Standing)

    @objc(addAway:)
    @NSManaged public func addToAway(_ values: NSSet)

    @objc(removeAway:)
    @NSManaged public func removeFromAway(_ values: NSSet)

}

extension Overall : Identifiable {

}
