//
//  StandingDetailsView.swift
//  SportsApp
//
//  Created by FIVE on 08.06.2022..
//

import Foundation
import UIKit
import PureLayout

class StandingDetailsView: UIScrollView {
    var sportsRepository: SportsRepository!
    var standing: Standing!
    
    var descriptionLabel: UILabel!
    var idLabel: UILabel!
    var id: UILabel!
    var resultLabel: UILabel!
    var result: UILabel!
    var statusLabel: UILabel!
    var status: UILabel!
    var pointsLabel: UILabel!
    var points: UILabel!
    
    // dodaj custom view
    var overallLabel: UILabel!
    var overallView: StatusView!
    var homeLabel: UILabel!
    var homeView: StatusView!
    var awayLabel: UILabel!
    var awayView: StatusView!
    
    init(sportsRepository: SportsRepository, standing: Standing) {
        super.init(frame: .zero)
        
        backgroundColor = .systemBlue
        self.sportsRepository = sportsRepository
        self.standing = standing
        
        buildViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViews() {
        descriptionLabel = UILabel()
        descriptionLabel.text = "Description"
        descriptionLabel.font = UIFont.boldSystemFont(ofSize: 30)
        descriptionLabel.textAlignment = NSTextAlignment.center
        addSubview(descriptionLabel)
        
        idLabel = UILabel()
        idLabel.text = "ID: "
        idLabel.font = UIFont.boldSystemFont(ofSize: 20)
        idLabel.numberOfLines = 0
        addSubview(idLabel)
        
        id = UILabel()
        id.text = String(standing.teamId)
        id.font = UIFont.systemFont(ofSize: 20)
        id.numberOfLines = 0
        addSubview(id)
        
        statusLabel = UILabel()
        statusLabel.text = "Status: "
        statusLabel.font = UIFont.boldSystemFont(ofSize: 20)
        statusLabel.numberOfLines = 0
        addSubview(statusLabel)
        
        status = UILabel()
        status.text = standing.status ?? "No status"
        status.font = UIFont.systemFont(ofSize: 20)
        status.numberOfLines = 0
        addSubview(status)
        
        resultLabel = UILabel()
        resultLabel.text = "Result: "
        resultLabel.font = UIFont.boldSystemFont(ofSize: 20)
        resultLabel.numberOfLines = 0
        addSubview(resultLabel)
        
        result = UILabel()
        result.text = standing.result ?? "No result"
        result.font = UIFont.systemFont(ofSize: 20)
        result.numberOfLines = 0
        addSubview(result)
        
        pointsLabel = UILabel()
        pointsLabel.text = "Points: "
        pointsLabel.font = UIFont.boldSystemFont(ofSize: 20)
        pointsLabel.numberOfLines = 0
        addSubview(pointsLabel)
        
        points = UILabel()
        points.text = String(standing.points)
        points.font = UIFont.systemFont(ofSize: 20)
        points.numberOfLines = 0
        addSubview(points)
        
        overallLabel = UILabel()
        overallLabel.text = "Overall"
        overallLabel.font = UIFont.boldSystemFont(ofSize: 30)
        overallLabel.numberOfLines = 0
        addSubview(overallLabel)
        
        overallView = StatusView(overall: standing.overall!)
        addSubview(overallView)
        
        homeLabel = UILabel()
        homeLabel.text = "Home"
        homeLabel.font = UIFont.boldSystemFont(ofSize: 30)
        homeLabel.numberOfLines = 0
        addSubview(homeLabel)
        
        homeView = StatusView(overall: standing.home!)
        addSubview(homeView)
        
        awayLabel = UILabel()
        awayLabel.text = "Away"
        awayLabel.font = UIFont.boldSystemFont(ofSize: 30)
        awayLabel.numberOfLines = 0
        addSubview(awayLabel)
        
        awayView = StatusView(overall: standing.away!)
        addSubview(awayView)
    }
    
    func addConstraints() {
        descriptionLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 0)
        descriptionLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 0)
        descriptionLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
        
        idLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 0)
        idLabel.autoPinEdge(.top, to: .bottom, of: descriptionLabel, withOffset: 10)
        
        id.autoPinEdge(.leading, to: .trailing, of: idLabel, withOffset: 0)
        id.autoPinEdge(.top, to: .bottom, of: descriptionLabel, withOffset: 10)
        
        statusLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 0)
        statusLabel.autoPinEdge(.top, to: .bottom, of: idLabel, withOffset: 10)
        
        status.autoPinEdge(.leading, to: .trailing, of: statusLabel, withOffset: 10)
        status.autoPinEdge(.top, to: .bottom, of: id, withOffset: 10)
        
        resultLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 0)
        resultLabel.autoPinEdge(.top, to: .bottom, of: statusLabel, withOffset: 10)
        
        result.autoPinEdge(.leading, to: .trailing, of: status, withOffset: 10)
        result.autoPinEdge(.top, to: .bottom, of: id, withOffset: 10)
        
        pointsLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 0)
        pointsLabel.autoPinEdge(.top, to: .bottom, of: resultLabel, withOffset: 10)
        
        points.autoPinEdge(.leading, to: .trailing, of: pointsLabel, withOffset: 10)
        points.autoPinEdge(.top, to: .bottom, of: result, withOffset: 10)
        
        overallLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 0)
        overallLabel.autoPinEdge(.top, to: .bottom, of: points, withOffset: 60)
        
        overallView.autoPinEdge(toSuperviewEdge: .leading, withInset: 0)
        overallView.autoPinEdge(.top, to: .bottom, of: overallLabel, withOffset: 10)
        
        homeLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 0)
        homeLabel.autoPinEdge(.top, to: .bottom, of: overallView, withOffset: 30)
        
        homeView.autoPinEdge(toSuperviewEdge: .leading, withInset: 0)
        homeView.autoPinEdge(.top, to: .bottom, of: homeLabel, withOffset: 10)
        
        awayLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 0)
        awayLabel.autoPinEdge(.top, to: .bottom, of: homeView, withOffset: 30)
        
        awayView.autoPinEdge(toSuperviewEdge: .leading, withInset: 0)
        awayView.autoPinEdge(.top, to: .bottom, of: awayLabel, withOffset: 10)
        awayView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 0)
    }
}
