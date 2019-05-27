//
//  PointsTableViewModel.swift
//  StarWarsTournament
//
//  Created by Jigar on 18/05/19.
//  Copyright © 2019 Jigar. All rights reserved.
//

import Foundation


protocol ViewProtocol : class {
    func reloadTable()
}


struct PlayerInfoData  {
    let id: Int
    let name: String
    let icon: String
    let score : Int
}


struct MatchInfoData  {
    let match: Int
    let player1, player2: PlayerInfoData
}

enum eSorting {
    case Ascending
    case Decending
}


class PointsTableViewModel  {
    //
    
    
    var playerScoreMap : [Int :Int ] = [:]
    weak var delegate : ViewProtocol?
    var service : ApiService!
    var playerInfo : Players = []
    var playerInfoModel : [PlayerInfoData] = []
    var matchInfo : [MatchInfo] = []
    
    var playerIDName : [Int : String] = [:]
    init() {
        service = ApiService()
    }
    
    func getPlayerCount() -> Int {
        return playerInfoModel.count
    }
    
    func getPlayerInfoAt(index : IndexPath) -> PlayerInfoData {
        return playerInfoModel[index.row]
    }
    
    func doSortingOfType(sortingType : eSorting) -> Void {
        if(sortingType == .Ascending){
            playerInfoModel.sort(by: { $0.score < $1.score })
        }else{
            playerInfoModel.sort(by: { $0.score > $1.score })
        }
        self.delegate?.reloadTable()
    }
    
    
    func fetchPlayerInfo() -> Void {
        service.fetchPlayerInfo{ (playerInfo , error ) in
            
            self.playerInfo = playerInfo!
            self.fetchMatchInfo()
        }
    }
    
    func getPlayerNameByID(id : Int) -> String {
        return playerIDName[id]!
    }
    
    
    func fetchMatchInfo() -> Void {
        service.fetchMatchInfo{ (playerInfo , error ) in
            
            self.matchInfo = playerInfo!
            self.calcuateScorePoints()
            self.updatePlayerPoints()
            self.delegate?.reloadTable()
            
        }
    }
    
    func updatePlayerPoints() -> Void {
        for player in playerInfo {
            if  playerScoreMap[player.id] != nil {
                let _playerInfoModel = PlayerInfoData(id: player.id, name: player.name, icon: player.icon, score: playerScoreMap[player.id]!)
                playerInfoModel.append(_playerInfoModel)
            }
            playerIDName[player.id] = player.name
        }
        playerInfoModel.sort(by: { $0.score > $1.score })
        
        
    }
    
    func calcuateScorePoints() -> Void {
        //
       
        
        for matchInfoItem in matchInfo{
            if(matchInfoItem.player1.score == matchInfoItem.player2.score) {
                
                if  playerScoreMap[matchInfoItem.player1.id] != nil {
                    playerScoreMap[matchInfoItem.player1.id] = playerScoreMap[matchInfoItem.player1.id]! + 1
                }
                else{
                   playerScoreMap[matchInfoItem.player1.id] =  1
                }
                
                if  playerScoreMap[matchInfoItem.player2.id] != nil {
                    playerScoreMap[matchInfoItem.player2.id] = playerScoreMap[matchInfoItem.player2.id]! + 1
                }
                else{
                    playerScoreMap[matchInfoItem.player2.id] =  1
                }
                
                
            }
            
            else if(matchInfoItem.player1.score > matchInfoItem.player2.score){
                
                if  playerScoreMap[matchInfoItem.player1.id] != nil {
                    playerScoreMap[matchInfoItem.player1.id] = playerScoreMap[matchInfoItem.player1.id]! + 3
                }
                else{
                    playerScoreMap[matchInfoItem.player1.id] =  3
                }
                
            }
            else {
                
                if  playerScoreMap[matchInfoItem.player2.id] != nil {
                    playerScoreMap[matchInfoItem.player2.id] = playerScoreMap[matchInfoItem.player2.id]! + 3
                }
                else{
                    playerScoreMap[matchInfoItem.player2.id] =  3
                }
                
            }
        }
    }
    
    
    func getPlayerMatchInfoDetails (player : Int ) -> [sPlayerPlayedDetails] {
        var filterList :  [sPlayerPlayedDetails]  = []
        for matchInfo in matchInfo {
            if(matchInfo.player1.id == player || matchInfo.player2.id == player){
                
                var status : eWinStatus = .Draw
                
                if(matchInfo.player1.score > matchInfo.player2.score){
                    if(matchInfo.player1.id == player){
                        status = .Win
                    }else{
                        status = .Loss
                    }
                }else if (matchInfo.player1.score < matchInfo.player2.score){
                    if(matchInfo.player1.id == player){
                        status = .Loss
                    }else{
                        status = .Win
                    }
                }
                
                let playerDetail : sPlayerPlayedDetails = sPlayerPlayedDetails(player1: sPlayerInfo(name: playerIDName[matchInfo.player1.id]!, score: matchInfo.player1.score), player2: sPlayerInfo(name: playerIDName[matchInfo.player2.id]!, score: matchInfo.player2.score), status: status)
                
                filterList.insert(playerDetail, at: 0)
            }
        }
        
        return filterList
    }
    
    
    
    
}
