//
//  PlayerDetailViewController.swift
//  StarWarsTournament
//
//  Created by Jigar on 18/05/19.
//  Copyright © 2019 Jigar. All rights reserved.
//

import Foundation
import UIKit





class PlayerDetailsViewController : UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var matchListViewModel : MatchListViewModel!
    var playersDetails :  [sPlayerPlayedDetails] = []
    var playername : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        matchListViewModel = MatchListViewModel(playersDetails: playersDetails)
        tableView.register(UINib(nibName: "PlayerMatchInfoViewCell", bundle: nil), forCellReuseIdentifier: "PlayerMatchInfoViewCellID")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UITableViewHeaderFooterView()
        self.navigationItem.title = playername
        self.tableView.allowsSelection = false
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    //
}





extension PlayerDetailsViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell: PlayerMatchInfoViewCell = tableView.dequeueReusableCell(withIdentifier: "PlayerMatchInfoViewCellID", for: indexPath) as! PlayerMatchInfoViewCell
        tableCell.setPlayerMatchInfo(playerInfo: playersDetails[indexPath.row])
        return tableCell
        
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return matchListViewModel.getCount()
    }
    
    
    
}

extension PlayerDetailsViewController : ViewProtocol {
    func reloadTable() {
        tableView.reloadData()
    }

}


extension PlayerDetailsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
        
        
    }
    
    
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return 70
        
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
}

