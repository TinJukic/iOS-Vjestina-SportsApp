//
//  SportsNetworkDataSource.swift
//  SportsApp
//
//  Created by FIVE on 31.05.2022..
//

import Foundation
import UIKit
import CoreData

class SportsNetworkDataSource {
    var networkService: NetworkService!
    var sportsDatabaseDataSource: SportsDatabaseDataSource!
    var managedContext: NSManagedObjectContext!
    
    init(managedContext: NSManagedObjectContext) {
        self.managedContext = managedContext
        self.sportsDatabaseDataSource = SportsDatabaseDataSource(managedContext: managedContext)
        networkService = NetworkService()
    }
    
    
}
