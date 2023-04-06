//
//  PlayerViewModel.swift
//  SimpleBasketballScore
//
//  Created by KJ on 4/2/23.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import Firebase

class PlayerViewModel: ObservableObject {
    
    @Published var players = [PlayerModel]()
    
    func addData(name: String, number: String) {
        let db = Firestore.firestore()
        let playerCollection = db.collection("Player")
        
        playerCollection.addDocument(data: ["name" : name, "number": number]) { error in
            if error == nil {
                // no error
                // get all the data after writing new data
                self.getData()
                
            } else {
                // handle error
                print("Error adding documents")
            }
        }
    }
    
    // update point for a player
    func updateStat(playerUpdate: PlayerModel, stat: String){
       
        // get reference to database
        let db = Firestore.firestore()
        let playerCollection = db.collection("Player")
        
        // stat for 1pt, 2pt, and 3pt
        var statToUpdate: String
            
        // update stats
        var updatedStat: Int?
        switch(stat) {
        case "1pt":
            statToUpdate = "point"
            updatedStat = playerUpdate.point + 1
            break
        case "2pt":
            statToUpdate = "point"
            updatedStat = playerUpdate.point + 2
            break
        case "3pt":
            statToUpdate = "point"
            updatedStat = playerUpdate.point + 3
            break
        case "Def\n reb":
            statToUpdate = "defReb"
            updatedStat = playerUpdate.def_reb + 1
            break
        case "Off\n reb":
            statToUpdate = "offReb"
            updatedStat = playerUpdate.off_reb + 1
            break
        case "asst":
            statToUpdate = "assist"
            updatedStat = playerUpdate.assist + 1
            break
        case "To":
            statToUpdate = "turnover"
            updatedStat = playerUpdate.turnover + 1
            break
        case "stl":
            statToUpdate = "steal"
            updatedStat = playerUpdate.steal + 1
            break
        case "blk":
            statToUpdate = "block"
            updatedStat = playerUpdate.block + 1
        default:
            statToUpdate = ""
            break
        }
        
        // merge the updated value on database
        playerCollection.document(playerUpdate.id).setData([statToUpdate: updatedStat!], merge: true) { error in
            //check error
            if error == nil {
                // refresh data
                self.getData()
            }
            else{
                // error handle
            }
        }
    }
    
    
    // get all the data on database
    func getData() {
        // get reference to database
        let db = Firestore.firestore()
        // read documents
        let playerCollection = db.collection("Player")
        
        playerCollection.getDocuments { (snapshot, error) in
            if error == nil {
                if let snapshot = snapshot{
                    
                    // update the players property
                    DispatchQueue.main.async {
                        
                        // Get all the documents and create Todos
                        self.players = snapshot.documents.map { d in
                            return PlayerModel(id: d.documentID,
                                               firstname: d["firstname"] as? String ?? "",
                                               lastname: d["lastname"] as? String ?? "",
                                               number: d["number"] as? String ?? "",
                                               picture: "kevin_durant",
                                               isOpponent: false,
                                               point: d["point"] as? Int ?? 0,
                                               assist: d["assist"] as? Int ?? 0,
                                               def_reb: d["assist"] as? Int ?? 0,
                                               off_reb: d["assist"] as? Int ?? 0,
                                               turnover: d["assist"] as? Int ?? 0,
                                               steal: d["assist"] as? Int ?? 0,
                                               block: d["assist"] as? Int ?? 0,
                                               foul: d["assist"] as? Int ?? 0)
                        }
                    }
                }
            }
            else {
                print("Error fetching documents")
            }
        }
    }
    
}
