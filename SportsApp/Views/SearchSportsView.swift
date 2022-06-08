//
//  SearchSportsView.swift
//  SportsApp
//
//  Created by FIVE on 31.05.2022..
//

import Foundation
import UIKit
import PureLayout

class SearchSportsView: UIView {
    var sportsCollectionView: UICollectionView!
    var navigationController: UINavigationController!
    var sportsRepository: SportsRepository!
    var players: [Player]!
    
    init(searchBarView: SearchBarView, navigationController: UINavigationController, sportsRepository: SportsRepository) {
        super.init(frame: .zero)
        
        backgroundColor = .yellow
        self.navigationController = navigationController
        self.sportsRepository = sportsRepository
        
        searchBarView.typingDelegate = self
        
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
    }
    
    func addConstraints() {
        sportsCollectionView.autoPinEdgesToSuperviewEdges()
    }
}

extension SearchSportsView: SearchBarTypingProtocol {
    func textTyping(text: String) {
        print(text)
        
        if text == "" {
            players = sportsRepository.sportsDatabaseDataSource?.fetchPlayers()
        } else {
            players = sportsRepository.sportsDatabaseDataSource?.searchPlayers(lastName: text)
        }
        
        sportsCollectionView.reloadData()
    }
}

extension SearchSportsView: UICollectionViewDataSource {
    func collectionView(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return players.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SportsViewCollectionCell.cellIdentifier, for: indexPath) as! PersonViewCollectionCell
        
        let person = players[indexPath.row]
        cell.setImage(imageLink: person.img ?? "")
        
        return cell
    }
}

extension SearchSportsView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//      logic when cell is selected
        print("Clicked on cell number \(indexPath.row)")
        
        let player = players[indexPath.row]
        let playerDetailsViewController = PlayerDetailsViewController(player: player)
        playerDetailsViewController.tabBarController?.selectedIndex = indexPath.row
        
        self.navigationController.pushViewController(playerDetailsViewController, animated: true)
    }
}

extension SearchSportsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 140)
    }
}
