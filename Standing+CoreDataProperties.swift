//
//  Standing+CoreDataProperties.swift
//  SportsApp
//
//  Created by FIVE on 08.06.2022..
//
//

import Foundation
import CoreData


extension Standing {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Standing> {
        return NSFetchRequest<Standing>(entityName: "Standing")
    }

    @NSManaged public var teamId: Int64
    @NSManaged public var points: Int32
    @NSManaged public var status: String?
    @NSManaged public var result: String?
    @NSManaged public var overall: Overall?
    @NSManaged public var home: Overall?
    @NSManaged public var away: Overall?

}

extension Standing : Identifiable {

}
