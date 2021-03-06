//
//  FavoritesController.swift
//  SportsApp
//
//  Created by FIVE on 31.05.2022..
//

import Foundation
import UIKit
import PureLayout
import CoreData

class FavoritesController: UIViewController {
    var favoritesView: FavoritesView!
    var context: NSManagedObjectContext!
    var sportsRepository: SportsRepository!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "SportsApp"
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemGreen
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        self.context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        self.sportsRepository = SportsRepository(managedContext: context)
        
        buildViews()
        addConstraints()
    }
    
    func buildViews() {
        favoritesView = FavoritesView(sportsRepository: sportsRepository, navigationController: navigationController!)
        view.addSubview(favoritesView)
    }
    
    func addConstraints() {
        favoritesView.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 20)
        favoritesView.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 20)
        favoritesView.autoPinEdge(toSuperviewSafeArea: .top, withInset: 20)
        favoritesView.autoPinEdge(toSuperviewSafeArea: .bottom, withInset: 0)
    }
}
