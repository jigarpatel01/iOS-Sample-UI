//
//  JsonParser.swift
//  StarWarsTournament
//
//  Created by Jigar on 18/05/19.
//  Copyright © 2019 Jigar. All rights reserved.
//

import Foundation


func convertDataToPlayerInfo(jsonData : Data) -> [PlayerInfo] {
    var playersInfo :[PlayerInfo] = []
    if let players = try? JSONDecoder().decode(Players.self, from: jsonData){
        playersInfo = players;
    }
    return playersInfo
}



func convertDataToMatchInfo(jsonData : Data) -> [MatchInfo] {
    var matchInfo :[MatchInfo] = []
    if let match = try? JSONDecoder().decode(MatchInfoArray.self, from: jsonData){
        matchInfo = match;
    }
    return matchInfo
}
