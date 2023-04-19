//
//  TeamViewModel.swift
//  SimpleBasketballScore
//
//  Created by KJ on 4/18/23.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import Firebase

class TeamViewModel: ObservableObject {
    @Published var teams = [TeamModel]()
    
    init() {
        self.getData()
    }
    
    // add team
    func addTeam(name: String, logo: String, league: String) {
        let db = Firestore.firestore()
        let teamCollection = db.collection("Teams")
        
        teamCollection.addDocument(data: ["name" : name,
                                          "logo" : logo,
                                          "league" : league,
                                          "win" : 0,
                                          "loss" : 0]) { error in
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
    
    // get all team data from firebase
    func getData() {
        // get reference to database
        let db = Firestore.firestore()
        // read documents
        let teamCollection = db.collection("Teams")
        
        teamCollection.getDocuments { (snapshot, error) in
            if error == nil {
                if let snapshot = snapshot{
                    
                    // update the teams property
                    DispatchQueue.main.async {
                        // Get all the documents and create team
                        self.teams = snapshot.documents.map { t in
                            return TeamModel(id: t.documentID,
                                             name: t["name"] as? String ?? "",
                                             logo: t["logo"] as? String ?? "",
                                             win: t["win"] as! Int,
                                             loss: t["loss"] as! Int,
                                            league: t["league"] as? String ?? "")
                            
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
