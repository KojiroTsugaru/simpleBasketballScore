//
//  GameModel.swift
//  SimpleBasketballScore
//
//  Created by KJ on 4/18/23.
//

import Foundation

class GameModel: TeamModel, ObservableObject {
    // for opponent
    var opponent_name: String = ""
    var opponent_logo: String = ""
    var opponent_league: String = ""
    var opponent_players = [PlayerModel]()
    
    init(opponent_name: String, opponent_logo: String, opponent_league: String, team: TeamModel) {
        self.opponent_name = opponent_name
        self.opponent_logo = opponent_logo
        self.opponent_league = opponent_league
        super.init(id: team.id, name: team.name, logo: team.logo, win: team.win, loss: team.loss, league: team.league)
    }
}
