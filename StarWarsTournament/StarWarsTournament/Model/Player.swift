//
//  Player.swift
//  StarWarsTournament
//
//  Created by Jigar on 18/05/19.
//  Copyright © 2019 Jigar. All rights reserved.
//

import Foundation

typealias Players = [PlayerInfo]

struct PlayerInfo: Codable {
    let id: Int
    let name: String
    let icon: String
}




