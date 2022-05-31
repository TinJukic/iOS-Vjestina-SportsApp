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
    init(searchBarView: SearchBarView) {
        super.init(frame: .zero)
        
        backgroundColor = .yellow
        
        searchBarView.typingDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
