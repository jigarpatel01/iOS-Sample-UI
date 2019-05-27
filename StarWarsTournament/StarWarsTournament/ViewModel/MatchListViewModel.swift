//
//  MatchListViewModel.swift
//  StarWarsTournament
//
//  Created by Jigar on 18/05/19.
//  Copyright © 2019 Jigar. All rights reserved.
//

import Foundation

enum eWinStatus {
    case Win
    case Loss
    case Draw
}

struct sPlayerPlayedDetails {
    let player1 : sPlayerInfo!
    let player2 : sPlayerInfo!
    let eWinStatus : eWinStatus!
    init(player1 : sPlayerInfo , player2 : sPlayerInfo , status : eWinStatus) {
        self.player1 = player1;
        self.player2 = player2;
        self.eWinStatus = status;
    }
}

struct sPlayerInfo {
    //
    let playerName :String;
    let playerScore : Int
    
    init(name : String , score : Int ) {
        playerName = name
        playerScore = score
    }
}

class MatchListViewModel  {
    //
    
    var playersDetails :  [sPlayerPlayedDetails] = []
    
    init(playersDetails : [sPlayerPlayedDetails]) {
        self.playersDetails = playersDetails
    }
    
    func getCount() -> Int {
        return playersDetails.count
    }
    
    func getItemAtIndex(index : IndexPath) -> sPlayerPlayedDetails {
        return playersDetails[index.row]
    }
    
}
