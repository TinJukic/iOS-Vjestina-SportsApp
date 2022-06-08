//
//  SportsView.swift
//  SportsApp
//
//  Created by FIVE on 31.05.2022..
//

import Foundation
import UIKit
import PureLayout
import CoreData

class SportsView: UIView {
    var sportsCollectionView: UICollectionView!
    var sportsRepository: SportsRepository!
    var players: [Player]!
    var navigationController: UINavigationController!
    
    init(sportsRepository: SportsRepository, navigationController: UINavigationController) {
        super.init(frame: .zero)
        
        self.backgroundColor = .white
        self.sportsRepository = sportsRepository
        self.navigationController = navigationController
        
        buildViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViews() {
        players = sportsRepository.sportsDatabaseDataSource?.fetchPlayers()
        print(players.count)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        sportsCollectionView = UICollectionView(
            frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height),
            collectionViewLayout: flowLayout
        )
        self.addSubview(sportsCollectionView)
        sportsCollectionView.register(PersonViewCollectionCell.self, forCellWithReuseIdentifier: PersonViewCollectionCell.cellIdentifier)
        sportsCollectionView.dataSource = self
        sportsCollectionView.delegate = self
        
        if(players.count > 0) {
            self.sportsCollectionView.reloadData()
        }
    }
    
    func addConstraints() {
        sportsCollectionView.autoPinEdgesToSuperviewEdges()
    }
}

extension SportsView: UICollectionViewDataSource {
    func collectionView(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return players.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SportsViewCollectionCell.cellIdentifier, for: indexPath) as! PersonViewCollectionCell
        
        cell.setImage(imageLink: players[indexPath.row].img ?? "")
        cell.layer.cornerRadius = 10
        
        return cell
    }
}

extension SportsView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//      logic when cell is selected
        print("Clicked on cell number \(indexPath.row)")
        
        let player = players[indexPath.row]
        let playerDetailsViewController = PlayerDetailsViewController(player: player)
        playerDetailsViewController.tabBarController?.selectedIndex = indexPath.row
        
        self.navigationController.pushViewController(playerDetailsViewController, animated: true)
    }
}

extension SportsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 140)
    }
}
