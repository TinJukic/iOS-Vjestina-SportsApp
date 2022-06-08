//
//  FavoritesView.swift
//  SportsApp
//
//  Created by FIVE on 31.05.2022..
//

import Foundation
import PureLayout
import UIKit

class FavoritesView: UIView {
    var sportsCollectionView: UICollectionView!
    var sportsRepository: SportsRepository!
    var standings: [Standing]!
    var navigationController: UINavigationController!
    
    init(sportsRepository: SportsRepository, navigationController: UINavigationController) {
        super.init(frame: .zero)
        
        backgroundColor = .white
        self.sportsRepository = sportsRepository
        self.navigationController = navigationController
        
        buildViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViews() {
        standings = sportsRepository.sportsDatabaseDataSource?.fetchStandings()
        print("Broj: " + String(standings.count))
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        sportsCollectionView = UICollectionView(
            frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height),
            collectionViewLayout: flowLayout
        )
        self.addSubview(sportsCollectionView)
        sportsCollectionView.register(SportsViewCollectionCell.self, forCellWithReuseIdentifier: SportsViewCollectionCell.cellIdentifier)
        sportsCollectionView.dataSource = self
        sportsCollectionView.delegate = self
    }
    
    func addConstraints() {
        sportsCollectionView.autoPinEdgesToSuperviewEdges()
    }
}

extension FavoritesView: UICollectionViewDataSource {
    func collectionView(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return standings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SportsViewCollectionCell.cellIdentifier, for: indexPath) as! SportsViewCollectionCell
        
        let standing = standings[indexPath.row]
        cell.addText(teamId: standing.teamId)
        
        return cell
    }
}

extension FavoritesView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//      logic when cell is selected
        print("Clicked on cell number \(indexPath.row)")
        
        let standing = standings[indexPath.row]
        let standingDetailsViewController = StandingDetailsViewController(standing: standing)
        standingDetailsViewController.tabBarController?.selectedIndex = indexPath.row
        
        self.navigationController.pushViewController(standingDetailsViewController, animated: true)
    }
}

extension FavoritesView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.bounds.width, height: 60)
    }
}
