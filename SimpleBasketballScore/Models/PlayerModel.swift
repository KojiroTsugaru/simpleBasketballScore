//
//  PlayerModel.swift
//  SimpleBasketballScore
//
//  Created by KJ on 4/2/23.
//

import Foundation

struct PlayerModel: Identifiable {
    let id: String
    var firstname: String
    var lastname: String
    var fullname: String{ firstname + " " + lastname}
    var number: String
    var picture: String
    var isOpponent: Bool
    
    var onPlay: Bool = false
    
    // data for all the player stats
    var point: Int
    var assist: Int
    var def_reb: Int
    var off_reb: Int
    var to_reb: Int { def_reb + off_reb }
    var turnover: Int
    var steal: Int
    var block: Int
    var foul: Int
    
    // team
    var team: String = ""
}
