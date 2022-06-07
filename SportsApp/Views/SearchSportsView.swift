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
    
    init(searchBarView: SearchBarView) {
        super.init(frame: .zero)
        
        backgroundColor = .yellow
        
        searchBarView.typingDelegate = self
        
        buildViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViews() {
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

extension SearchSportsView: SearchBarTypingProtocol {
    func textTyping(text: String) {
        print(text)
        
        if text == "" {
            
        } else {
            
        }
    }
}

extension SearchSportsView: UICollectionViewDataSource {
    func collectionView(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SportsViewCollectionCell.cellIdentifier, for: indexPath) as! SportsViewCollectionCell
        return cell
    }
}

extension SearchSportsView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//      logic when cell is selected
        print("Clicked on cell number \(indexPath.row)")
    }
}

extension SearchSportsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.bounds.width, height: 140)
    }
}
