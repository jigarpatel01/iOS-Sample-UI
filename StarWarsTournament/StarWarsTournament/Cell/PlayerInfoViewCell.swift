//
//  PlayerInfoViewCell.swift
//  StarWarsTournament
//
//  Created by Jigar on 18/05/19.
//  Copyright © 2019 Jigar. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class PlayerInfoViewCell: UITableViewCell {

    
    @IBOutlet weak var playerPoints: UILabel!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    
    var _indexPath : IndexPath?
    var _PlayerInfo : PlayerInfoData?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setPlayerInfo(playerInfo : PlayerInfoData) -> Void {
        _PlayerInfo = playerInfo
        playerName.text = playerInfo.name
        playerPoints.text = String(playerInfo.score)
        Alamofire.request((_PlayerInfo?.icon)!).responseImage { response in
            if let image = response.result.value {
                self.playerImage.image = image
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
