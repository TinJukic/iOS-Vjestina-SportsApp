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
        
        self.backgroundColor = .systemGray5
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
        cellLabel.textAlignment = .center
        addSubview(cellLabel)
    }
    
    func addConstraints() {
        cellLabel.autoPinEdgesToSuperviewSafeArea()
        cellLabel.autoCenterInSuperview()
    }
    
    func addText(teamId: Int64) {
        cellLabel.text = "Team with id: " + String(teamId)
    }
}
