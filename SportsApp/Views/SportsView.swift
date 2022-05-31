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
    
    
    init() {
        super.init(frame: .zero)
        
        self.backgroundColor = .red
        
        buildViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViews() {
        
    }
    
    func addConstraints() {
        
    }
}
