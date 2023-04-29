//
//  TeamModel.swift
//  SimpleBasketballScore
//
//  Created by KJ on 4/11/23.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import Firebase

class TeamModel: Identifiable {
    var id: String = ""
    var name: String = ""
    var logo: String = ""
    var win: Int = 0
    var loss: Int = 0
    var league: String = ""
    
    var players = [PlayerModel]()
    var games = [GameModel]()
    
    init(id: String, name: String, logo: String, win: Int, loss: Int, league: String, players: [PlayerModel] = [PlayerModel](), games: [GameModel] = [GameModel]()) {
        self.id = id
        self.name = name
        self.logo = logo
        self.win = win
        self.loss = loss
        self.league = league
        self.players = players
        self.games = games
    }
    
    // add game
    func addGame(opponent_name: String, opponent_logo: String, opponent_league: String) {
        let db = Firestore.firestore()
        let teamCollection = db.collection("Teams").document(self.id)
        let gameCollection = teamCollection.collection("Games")
        
        gameCollection.addDocument(data: ["opponent_name": opponent_name, "opponent_logo": opponent_logo, "opponent_league": opponent_league]) { error in
                //check error
                if error == nil {
                    // refresh data
                    let model = TeamViewModel()
                    model.getData()
                }
                else{
                    // error handle
                }
            }
        }
    
    func getGameData() {
        // get reference to team collection
        let db = Firestore.firestore()
        let teamCollection = db.collection("Teams").document(self.id)
        let gameCollection = teamCollection.collection("games")
        
        gameCollection.getDocuments { (snapshot, error) in
            if error == nil {
                if let snapshot = snapshot{
                    // update the games property in each team
                    
                    DispatchQueue.main.async {
                        // Get all the documents and create game
                        self.games = snapshot.documents.map { g in
                            return GameModel(opponent_name: g["opponent_name"] as? String ?? "",
                                             opponent_logo: g["opponent_logo"] as? String ?? "",
                                             opponent_league: g["opponent_league"] as? String ?? "",
                                             team: self)
                            
                        }
                    }
                }
                else {
                    print("Error fetching documents")
                }
            }
        }
    }
}
