//
//  PersonViewCollectionCell.swift
//  SportsApp
//
//  Created by FIVE on 08.06.2022..
//

import Foundation
import UIKit
import PureLayout

class PersonViewCollectionCell: UICollectionViewCell {
    static let cellIdentifier = "cellIdentifier"
    var cellLabel: UILabel!
    var imageLink: String!
    var playerImage: UIImageView!
    
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
//        cellLabel = UILabel()
//        cellLabel.text = "person"
//        addSubview(cellLabel)
    }
    
    func addConstraints() {
//        cellLabel.autoPinEdgesToSuperviewSafeArea()
        self.layer.cornerRadius = 10
    }
    
    public func setImage(imageLink: String) {
        self.imageLink = imageLink
        playerImage = UIImageView()
        
        // postavljanje slike
        if(imageLink != "") {
            DispatchQueue.global().async {
                do {
                    let url = URL(string: self.imageLink)!
                    let data = try Data(contentsOf: url)
                    
                    DispatchQueue.main.async {
                        self.playerImage.image = UIImage(data: data)
                    }
                } catch {
                    print(error)
                }
            }
        }
        
        self.addSubview(playerImage)
        playerImage.autoPinEdgesToSuperviewEdges()
        playerImage.layer.cornerRadius = 10
    }
}
