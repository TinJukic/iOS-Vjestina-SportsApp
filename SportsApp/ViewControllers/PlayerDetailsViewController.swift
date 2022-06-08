//
//  PlayerDetailsViewController.swift
//  SportsApp
//
//  Created by FIVE on 08.06.2022..
//

import Foundation
import UIKit
import PureLayout

class PlayerDetailsViewController: UIViewController {
    var player: Player?
    var playerDetailsView: PlayerDetailsView!
    
    convenience init() {
        self.init(player: Player(context: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext))
    }
    
    init(player: Player) {
        self.player = player
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
        
        buildViews()
        addConstraints()
    }
    
    func buildViews() {
        playerDetailsView = PlayerDetailsView(player: player!)
        view.addSubview(playerDetailsView)
    }
    
    func addConstraints() {
        playerDetailsView.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        playerDetailsView.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
        playerDetailsView.autoPinEdge(toSuperviewEdge: .top, withInset: 20)
        playerDetailsView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 0)
    }
}
