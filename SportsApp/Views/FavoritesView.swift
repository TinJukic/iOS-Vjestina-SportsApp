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
    var favoritesLabel: UILabel!
    var favoritesCollection: UICollectionView!
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .brown
        
        buildViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViews() {
        favoritesLabel = UILabel()
        favoritesLabel.text = "Favorites"
        favoritesLabel.font = UIFont.boldSystemFont(ofSize: 20)
        addSubview(favoritesLabel)
    }
    
    func addConstraints() {
        favoritesLabel.autoPinEdge(toSuperviewSafeArea: .top, withInset: 0)
        favoritesLabel.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 0)
        favoritesLabel.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 0)
    }
}
