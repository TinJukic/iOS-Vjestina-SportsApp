//
//  Player+CoreDataProperties.swift
//  SportsApp
//
//  Created by FIVE on 08.06.2022..
//
//

import Foundation
import CoreData


extension Player {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Player> {
        return NSFetchRequest<Player>(entityName: "Player")
    }

    @NSManaged public var playerId: Int64
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var birthday: String?
    @NSManaged public var age: Int16
    @NSManaged public var weight: Int32
    @NSManaged public var height: Int32
    @NSManaged public var img: String?
    @NSManaged public var country: Country?

}

extension Player : Identifiable {

}
