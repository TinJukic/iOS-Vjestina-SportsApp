//
//  SportsRepository.swift
//  SportsApp
//
//  Created by FIVE on 31.05.2022..
//

import Foundation
import UIKit
import CoreData

class SportsRepository {
    var managedContext: NSManagedObjectContext!
    var sportsDatabaseDataSource: SportsDatabaseDataSource?
    var sportsNetworkDataSource: SportsNetworkDataSource?
    
    init(managedContext: NSManagedObjectContext) {
        self.managedContext = managedContext
        
        sportsDatabaseDataSource = SportsDatabaseDataSource(managedContext: managedContext)
        sportsNetworkDataSource = SportsNetworkDataSource(managedContext: managedContext)
    }
    
    func appLaunch() {
        print("Updating database...")
    }
}
