//
//  StatusView.swift
//  SportsApp
//
//  Created by FIVE on 08.06.2022..
//

import Foundation
import UIKit
import PureLayout

class StatusView: UIView {
    var overall: Overall!
    
    var gamesPlayedLabel: UILabel!
    var gamesPlayed: UILabel!
    var wonLabel: UILabel!
    var won: UILabel!
    var lostLabel: UILabel!
    var lost: UILabel!
    var drawLabel: UILabel!
    var draw: UILabel!
    var goalsScoredLabel: UILabel!
    var goalsScored: UILabel!
    var goalsAgainstLabel: UILabel!
    var goalsAgainst: UILabel!
    var goalsDiffLabel: UILabel!
    var goalsDiff: UILabel!
    
    init(overall: Overall) {
        super.init(frame: .zero)
        
        self.backgroundColor = .systemGray
        self.overall = overall
        
        buildViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViews() {
        gamesPlayedLabel = UILabel()
        gamesPlayedLabel.text = "Games played: "
        gamesPlayedLabel.font = UIFont.boldSystemFont(ofSize: 20)
        gamesPlayedLabel.numberOfLines = 0
        addSubview(gamesPlayedLabel)
        
        gamesPlayed = UILabel()
        gamesPlayed.text = String(overall.gamesPlayed)
        gamesPlayed.font = UIFont.systemFont(ofSize: 20)
        gamesPlayed.numberOfLines = 0
        addSubview(gamesPlayed)
        
        wonLabel = UILabel()
        wonLabel.text = "Won: "
        wonLabel.font = UIFont.boldSystemFont(ofSize: 20)
        wonLabel.numberOfLines = 0
        addSubview(wonLabel)
        
        won = UILabel()
        won.text = String(overall.won)
        won.font = UIFont.systemFont(ofSize: 20)
        won.numberOfLines = 0
        addSubview(won)
        
        lostLabel = UILabel()
        lostLabel.text = "Lost: "
        lostLabel.font = UIFont.boldSystemFont(ofSize: 20)
        lostLabel.numberOfLines = 0
        addSubview(lostLabel)
        
        lost = UILabel()
        lost.text = String(overall.lost)
        lost.font = UIFont.systemFont(ofSize: 20)
        lost.numberOfLines = 0
        addSubview(lost)
        
        drawLabel = UILabel()
        drawLabel.text = "Draw: "
        drawLabel.font = UIFont.boldSystemFont(ofSize: 20)
        drawLabel.numberOfLines = 0
        addSubview(drawLabel)
        
        draw = UILabel()
        draw.text = String(overall.draw)
        draw.font = UIFont.systemFont(ofSize: 20)
        draw.numberOfLines = 0
        addSubview(draw)
        
        goalsScoredLabel = UILabel()
        goalsScoredLabel.text = "Goals scored: "
        goalsScoredLabel.font = UIFont.boldSystemFont(ofSize: 20)
        goalsScoredLabel.numberOfLines = 0
        addSubview(goalsScoredLabel)
        
        goalsScored = UILabel()
        goalsScored.text = String(overall.goalsScored)
        goalsScored.font = UIFont.systemFont(ofSize: 20)
        goalsScored.numberOfLines = 0
        addSubview(goalsScored)
        
        goalsAgainstLabel = UILabel()
        goalsAgainstLabel.text = "Goals against: "
        goalsAgainstLabel.font = UIFont.boldSystemFont(ofSize: 20)
        goalsAgainstLabel.numberOfLines = 0
        addSubview(goalsAgainstLabel)
        
        goalsAgainst = UILabel()
        goalsAgainst.text = String(overall.goalsAgainst)
        goalsAgainst.font = UIFont.systemFont(ofSize: 20)
        goalsAgainst.numberOfLines = 0
        addSubview(goalsAgainst)
        
        goalsDiffLabel = UILabel()
        goalsDiffLabel.text = "Goals difference: "
        goalsDiffLabel.font = UIFont.boldSystemFont(ofSize: 20)
        goalsDiffLabel.numberOfLines = 0
        addSubview(goalsDiffLabel)
        
        goalsDiff = UILabel()
        goalsDiff.text = String(overall.goalsDiff)
        goalsDiff.font = UIFont.systemFont(ofSize: 20)
        goalsDiff.numberOfLines = 0
        addSubview(goalsDiff)
    }
    
    func addConstraints() {
        gamesPlayedLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 0)
        gamesPlayedLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
        
        gamesPlayed.autoPinEdge(.leading, to: .trailing, of: gamesPlayedLabel, withOffset: 10)
        gamesPlayed.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
        
        wonLabel.autoPinEdge(.top, to: .bottom, of: gamesPlayedLabel, withOffset: 10)
        wonLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 0)
        
        won.autoPinEdge(.top, to: .bottom, of: gamesPlayed, withOffset: 10)
        won.autoPinEdge(.leading, to: .trailing, of: wonLabel, withOffset: 10)
        
        lostLabel.autoPinEdge(.top, to: .bottom, of: wonLabel, withOffset: 10)
        lostLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 0)
        
        lost.autoPinEdge(.top, to: .bottom, of: won, withOffset: 10)
        lost.autoPinEdge(.leading, to: .trailing, of: lostLabel, withOffset: 10)
        
        drawLabel.autoPinEdge(.top, to: .bottom, of: lostLabel, withOffset: 10)
        drawLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 0)
        
        draw.autoPinEdge(.top, to: .bottom, of: lost, withOffset: 10)
        draw.autoPinEdge(.leading, to: .trailing, of: drawLabel, withOffset: 10)
        
        goalsScoredLabel.autoPinEdge(.top, to: .bottom, of: drawLabel, withOffset: 10)
        goalsScoredLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 0)
        
        goalsScored.autoPinEdge(.top, to: .bottom, of: draw, withOffset: 10)
        goalsScored.autoPinEdge(.leading, to: .trailing, of: goalsScoredLabel, withOffset: 10)
        
        goalsAgainstLabel.autoPinEdge(.top, to: .bottom, of: goalsScoredLabel, withOffset: 10)
        goalsAgainstLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 0)
        
        goalsAgainst.autoPinEdge(.top, to: .bottom, of: goalsScored, withOffset: 10)
        goalsAgainst.autoPinEdge(.leading, to: .trailing, of: goalsAgainstLabel, withOffset: 20)
        
        goalsDiffLabel.autoPinEdge(.top, to: .bottom, of: goalsAgainstLabel, withOffset: 10)
        goalsDiffLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 0)
        
        goalsDiff.autoPinEdge(.top, to: .bottom, of: goalsAgainst, withOffset: 10)
        goalsDiff.autoPinEdge(.leading, to: .trailing, of: goalsDiffLabel, withOffset: 10)
        goalsDiff.autoPinEdge(toSuperviewEdge: .bottom, withInset: 0)
    }
}
