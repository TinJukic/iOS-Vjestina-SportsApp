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
}
