//
//  SportsViewCollectionCell.swift
//  SportsApp
//
//  Created by FIVE on 07.06.2022..
//

import Foundation
import UIKit
import PureLayout

class SportsViewCollectionCell: UICollectionViewCell {
    static let cellIdentifier = "cellIdentifier"
    var cellLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .systemGreen
        self.layer.cornerRadius = 10
        
        buildViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViews() {
        cellLabel = UILabel()
        cellLabel.text = "cell"
        addSubview(cellLabel)
    }
    
    func addConstraints() {
        cellLabel.autoPinEdgesToSuperviewSafeArea()
    }
}
