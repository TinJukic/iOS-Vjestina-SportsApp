//
//  PlayerDetailsView.swift
//  SportsApp
//
//  Created by FIVE on 08.06.2022..
//

import Foundation
import UIKit
import PureLayout

class PlayerDetailsView: UIView {
    var player: Player!
    var playerImage: UIImageView!
    var nameAgeLabel: UILabel!
    var birthdayLabel: UILabel!
    var height: UILabel!
    var weight: UILabel!
    var countryName: UILabel!
    
    var countryL: UILabel!
    var dateLabel: UILabel!
    var weightLabel: UILabel!
    var heightLabel: UILabel!
    
    init(player: Player) {
        super.init(frame: .zero)
        
        self.backgroundColor = .white
        self.player = player
        
        buildViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViews() {
        playerImage = UIImageView()
        self.playerImage.image = UIImage(systemName: "person")
        self.playerImage.tintColor = .systemGreen
        if(self.player.img != "") {
            playerImage.image = nil
            DispatchQueue.global().async {
                do {
                    let urlString = self.player.img ?? ""
                    if(urlString != "") {
                        let url = URL(string: urlString)!
                        let data = try Data(contentsOf: url)
                        
                        DispatchQueue.main.async {
                            self.playerImage.image = UIImage(data: data)
                        }
                    }
                } catch {
                    print(error)
                }
            }
        }
        addSubview(playerImage)
        
        nameAgeLabel = UILabel()
        let firstName = player.firstName ?? ""
        let lastName = player.lastName ?? ""
        nameAgeLabel.text = firstName + " " + lastName + " (" + String(player.age) + ")"
        nameAgeLabel.font = UIFont.boldSystemFont(ofSize: 20)
        nameAgeLabel.numberOfLines = 0
        addSubview(nameAgeLabel)
        
        countryL = UILabel()
        countryL.text = (player.country?.name ?? "") + " (" + (player.country?.countryCode ?? "") + ")"
        countryL.font = UIFont.boldSystemFont(ofSize: 20)
        countryL.numberOfLines = 0
        addSubview(countryL)
        
        dateLabel = UILabel()
        dateLabel.text = "Date of birth: "
        dateLabel.font = UIFont.boldSystemFont(ofSize: 20)
        dateLabel.numberOfLines = 0
        addSubview(dateLabel)
        
        birthdayLabel = UILabel()
        let birthday = player.birthday!.split(separator: "-")
        birthdayLabel.text = birthday[2] + "." + birthday[1] + "." + birthday[0] + "."
        birthdayLabel.font = UIFont.systemFont(ofSize: 20)
        birthdayLabel.numberOfLines = 0
        addSubview(birthdayLabel)
        
        heightLabel = UILabel()
        heightLabel.text = "Height: "
        heightLabel.font = UIFont.boldSystemFont(ofSize: 20)
        heightLabel.numberOfLines = 0
        addSubview(heightLabel)
        
        height = UILabel()
        if(player.height == -1) {
            height.text = "No info"
        } else {
            height.text = String(player.height)
        }
        height.font = UIFont.systemFont(ofSize: 20)
        height.numberOfLines = 0
        addSubview(height)
        
        weightLabel = UILabel()
        weightLabel.text = "Weight: "
        weightLabel.font = UIFont.boldSystemFont(ofSize: 20)
        weightLabel.numberOfLines = 0
        addSubview(weightLabel)
        
        weight = UILabel()
        if(player.weight == -1) {
            weight.text = "No info"
        } else {
            height.text = String(player.weight)
        }
        weight.font = UIFont.systemFont(ofSize: 20)
        weight.numberOfLines = 0
        addSubview(weight)
        
        countryName = UILabel()
        countryName.text = player.country?.name
        countryName.font = UIFont.systemFont(ofSize: 20)
        countryName.numberOfLines = 0
        addSubview(countryName)
    }
    
    func addConstraints() {
        playerImage.autoSetDimensions(to: CGSize(width: 120, height: 140))
        playerImage.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 0)
        playerImage.autoPinEdge(toSuperviewSafeArea: .top, withInset: 0)
        
        nameAgeLabel.autoPinEdge(.leading, to: .trailing, of: playerImage, withOffset: 20)
        nameAgeLabel.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 0)
        nameAgeLabel.autoPinEdge(toSuperviewSafeArea: .top, withInset: 10)
        
        countryName.autoPinEdge(.leading, to: .trailing, of: playerImage, withOffset: 20)
        countryName.autoPinEdge(.top, to: .bottom, of: nameAgeLabel, withOffset: 10)
        countryName.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 0)
        
        dateLabel.autoPinEdge(.top, to: .bottom, of: playerImage, withOffset: 20)
        dateLabel.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 0)
        
        birthdayLabel.autoPinEdge(.top, to: .bottom, of: playerImage, withOffset: 20)
        birthdayLabel.autoPinEdge(.leading, to: .trailing, of: dateLabel, withOffset: 10)
        
        heightLabel.autoPinEdge(.top, to: .bottom, of: birthdayLabel, withOffset: 20)
        heightLabel.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 0)
        
        height.autoPinEdge(.top, to: .bottom, of: birthdayLabel, withOffset: 20)
        height.autoPinEdge(.leading, to: .trailing, of: heightLabel, withOffset: 10)
        
        weightLabel.autoPinEdge(.top, to: .bottom, of: height, withOffset: 20)
        weightLabel.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 0)
        
        weight.autoPinEdge(.top, to: .bottom, of: height, withOffset: 20)
        weight.autoPinEdge(.leading, to: .trailing, of: weightLabel, withOffset: 10)
    }
}
