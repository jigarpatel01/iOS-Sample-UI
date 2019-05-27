//
//  ViewController.swift
//  StarWarsTournament
//
//  Created by Jigar on 18/05/19.
//  Copyright © 2019 Jigar. All rights reserved.
//

import UIKit

class PointsTableViewController : UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var selectedCell : IndexPath?
    var pointsTableViewModel = PointsTableViewModel()
    var sorting : eSorting = .Decending
    
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var sortingBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "PlayerInfoViewCell", bundle: nil), forCellReuseIdentifier: "PlayerInfoViewCellID")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UITableViewHeaderFooterView()
        pointsTableViewModel.fetchPlayerInfo()
        pointsTableViewModel.delegate = self
        self.navigationItem.title = "Star Wars result"
        updateSortingButton()
        loadingIndicator.startAnimating()
        loadingIndicator.transform = CGAffineTransform(scaleX: 3, y: 3)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        
        
        if let destination = segue.destination as? PlayerDetailsViewController {
            destination.playersDetails = pointsTableViewModel.getPlayerMatchInfoDetails(player: pointsTableViewModel.getPlayerInfoAt(index: selectedCell!).id)
            destination.playername =  pointsTableViewModel.getPlayerNameByID(id: pointsTableViewModel.getPlayerInfoAt(index: selectedCell!).id)
        }
        
    }
    @IBAction func onSortingBtnTouched(_ sender: Any) {
        updateSortingButton()
        if(sorting == .Ascending){
            sorting = .Decending
        }else{
            sorting = .Ascending
        }
        pointsTableViewModel.doSortingOfType(sortingType: sorting)
        
    }
    
    
    func updateSortingButton() -> Void {
        UIView.animate(withDuration: 0.5) {
            if(self.sorting == .Ascending){
                self.sortingBtn.transform = CGAffineTransform(rotationAngle: CGFloat(180 * Float.pi)/180)
            }else{
                self.sortingBtn.transform = CGAffineTransform(rotationAngle: (0 * CGFloat.pi)/180 )
            }
        }
    }
    

}



extension PointsTableViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell: PlayerInfoViewCell = tableView.dequeueReusableCell(withIdentifier: "PlayerInfoViewCellID", for: indexPath) as! PlayerInfoViewCell
        let pInfo = pointsTableViewModel.getPlayerInfoAt(index: indexPath)
        tableCell.setPlayerInfo(playerInfo: pInfo)
        tableCell._indexPath = indexPath
        
        return tableCell
        
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pointsTableViewModel.getPlayerCount()
    }
    
    
    
}

extension PointsTableViewController : ViewProtocol {
    func reloadTable() {
        //
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        loadingIndicator.stopAnimating()
        loadingIndicator.isHidden = true
    }

    
}


extension PointsTableViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCell = indexPath
        performSegue(withIdentifier: "PlayerDetails", sender: self)
    }
    
    
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
            return 80
        
        
    }
    
    
}


