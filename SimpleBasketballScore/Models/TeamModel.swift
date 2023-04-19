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

struct TeamModel: Identifiable {
    let id: String
    var name: String
    var logo: String
    var win: Int
    var loss: Int
    var league: String
    
    var players = [PlayerModel]()
    var opponents = [OpponentModel]()
    
    // add opponent
    func addOpponent(name: String, logo: String, league: String) {
        let db = Firestore.firestore()
        let teamCollection = db.collection("Teams").document(self.id)
        let opponentCollection = teamCollection.collection("opponents")
        
        opponentCollection.addDocument(data: ["name": name, "logo": logo, "league": league]) { error in
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
}
