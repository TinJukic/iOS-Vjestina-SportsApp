//
//  NoInternetConnectionView.swift
//  SportsApp
//
//  Created by FIVE on 31.05.2022..
//

import Foundation
import UIKit
import PureLayout

class NoInternetConnectionView: UIView {
    var label: UILabel!
    
    init() {
        super.init(frame: .zero)
        
        buildViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViews() {
        label = UILabel()
        label.text = "Your iPhone is not connected to the internet. Please connect your iPhone to the internet and try again!"
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.textColor = .black
        self.addSubview(label)
    }
    
    func addConstraints() {
        label.autoPinEdgesToSuperviewSafeArea()
    }
}

