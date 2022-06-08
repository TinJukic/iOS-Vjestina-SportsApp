//
//  SportsViewController.swift
//  SportsApp
//
//  Created by FIVE on 31.05.2022..
//

import Foundation
import UIKit
import PureLayout
import CoreData
import Network

class SportsViewController: UIViewController {
    var sportsView: SportsView!
    var connected = false
    var noInternetConnectionView: NoInternetConnectionView!
    var context: NSManagedObjectContext!
    var sportsRepository: SportsRepository!
    var searchBarView: SearchBarView!
    var searchSportsView: SearchSportsView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "SportsApp"
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemGreen
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "InternetConnectionMonitor")
        
        monitor.pathUpdateHandler = { pathUpdateHandler in
            if pathUpdateHandler.status == .satisfied {
                print("Connected!")
                self.connected = true
            } else {
                print("Not connected!")
                self.connected = false
            }
        }
        monitor.start(queue: queue)
        
        self.context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        self.sportsRepository = SportsRepository(managedContext: context)
        
        buildViews()
        addConstraints()
    }
    
    func buildViews() {
        if connected == true {
            sportsRepository.appLaunch() // osvjezi podatke
            
            searchBarView = SearchBarView(delegate: self)
            view.addSubview(searchBarView)
            
            searchSportsView = SearchSportsView(searchBarView: searchBarView, navigationController: navigationController!, sportsRepository: sportsRepository)
            searchSportsView.isHidden = true
            view.addSubview(searchSportsView)
            
            sportsView = SportsView(sportsRepository: sportsRepository, navigationController: navigationController!)
            view.addSubview(sportsView)
            
        } else {
            noInternetConnectionView = NoInternetConnectionView()
            view.addSubview(noInternetConnectionView)
        }
    }
    
    func addConstraints() {
        if connected == true {
            searchBarView.autoPinEdge(toSuperviewSafeArea: .top, withInset: 20)
            searchBarView.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 20)
            searchBarView.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 20)
            searchBarView.layer.cornerRadius = 10
            
            searchSportsView.autoPinEdge(.top, to: .bottom, of: searchBarView, withOffset: 20)
            searchSportsView.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 20)
            searchSportsView.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 20)
            searchSportsView.autoPinEdge(toSuperviewSafeArea: .bottom, withInset: 0)
            
            sportsView.autoPinEdge(.top, to: .bottom, of: searchBarView, withOffset: 20)
            sportsView.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 20)
            sportsView.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 20)
            sportsView.autoPinEdge(toSuperviewSafeArea: .bottom, withInset: 0)
        } else {
            noInternetConnectionView = NoInternetConnectionView()
        }
    }
}

extension SportsViewController: SearchBarViewDelegate {
    func didSelectSearchBar() {
        sportsView.isHidden = true
        searchSportsView.isHidden = false
    }
    
    func didDeselectSearchBar() {
        sportsView.isHidden = false
        searchSportsView.isHidden = true
    }
}
