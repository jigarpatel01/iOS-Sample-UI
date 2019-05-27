//
//  PlayerMatchInfoViewCell.swift
//  StarWarsTournament
//
//  Created by Jigar on 18/05/19.
//  Copyright © 2019 Jigar. All rights reserved.
//

import UIKit

class PlayerMatchInfoViewCell: UITableViewCell {
    
    @IBOutlet weak var playerLeft: UILabel!
    
    @IBOutlet weak var PlayerRight: UILabel!
    @IBOutlet weak var matchScore: UILabel!
    
    var matchInfo : sPlayerPlayedDetails?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setPlayerMatchInfo(playerInfo : sPlayerPlayedDetails) -> Void {
        matchInfo = playerInfo
        playerLeft.text = matchInfo?.player1.playerName
        PlayerRight.text = matchInfo?.player2.playerName
        matchScore.text = (matchInfo?.player1.playerScore.description)! + " - " + (matchInfo?.player2.playerScore.description)!
        
        if(matchInfo?.eWinStatus == .Win){
            self.layer.backgroundColor = UIColor.green.cgColor
        }else if (matchInfo?.eWinStatus == .Loss){
            self.layer.backgroundColor = UIColor.red.cgColor
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
