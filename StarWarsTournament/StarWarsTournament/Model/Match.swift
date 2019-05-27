//
//  Match.swift
//  StarWarsTournament
//
//  Created by Jigar on 18/05/19.
//  Copyright © 2019 Jigar. All rights reserved.
//

import Foundation

typealias MatchInfoArray = [MatchInfo]

struct MatchInfo: Codable {
    let match: Int
    let player1, player2: Player
}

struct Player: Codable {
    let id, score: Int
}
