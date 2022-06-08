//
//  StandingDetailsViewController.swift
//  SportsApp
//
//  Created by FIVE on 08.06.2022..
//

import Foundation
import UIKit
import PureLayout
import CoreData

class StandingDetailsViewController: UIViewController {
    var context: NSManagedObjectContext!
    var sportsRepository: SportsRepository!
    var standingDetailsView: StandingDetailsView!
    var standing: Standing!
    
    convenience init() {
        self.init(standing: Standing(context: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext))
    }
    
    init(standing: Standing) {
        self.standing = standing
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        standingDetailsView = StandingDetailsView(sportsRepository: sportsRepository, standing: standing)
        view.addSubview(standingDetailsView)
    }
    
    func addConstraints() {
        standingDetailsView.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 20)
        standingDetailsView.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 20)
        standingDetailsView.autoPinEdge(toSuperviewSafeArea: .top, withInset: 20)
        standingDetailsView.autoPinEdge(toSuperviewSafeArea: .bottom, withInset: 0)
    }
}
