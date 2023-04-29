//
//  SelectOpponentView.swift
//  SimpleBasketballScore
//
//  Created by KJ on 4/13/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct SelectOpponentView: View {
    @State private var teamname: String = ""
    
    // for sheet and inGameView
    @Binding var isShowNewGame: Bool
    @Binding var inGameView: Bool
    
    @Binding var gameToPlay: GameModel?
    
    // for team selected
    let teamSelected: TeamModel
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Team Logo").font(.system(size: 20))) {
                    TextField("Team Name", text: $teamname)
                        .frame(height: 80)
                }
                Section(header: Text("Team Info").font(.system(size: 20))) {
                    TextField("Team Name", text: $teamname)
                        .frame(height: 80)
                    TextField("Team League", text: $teamname)
                        .frame(height: 80)
                }
            }
            .navigationTitle("Create Opponent Team")
            .navigationBarTitleDisplayMode(.large)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    let game = GameModel(opponent_name: teamname, opponent_logo: "kevin_durant", opponent_league: "NBA", team: teamSelected)
                    gameToPlay = game
                    // add game to Firebase here?
                    teamSelected.addGame(opponent_name: teamname, opponent_logo: "kevin_durant", opponent_league: "NBA")
                    
                    isShowNewGame = false
                    inGameView = true
                } label: {
                    Text("Done")
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

//struct SelectOpponentView_Previews: PreviewProvider {
//    @State static var isShowNewGame = true
//    @State static var inGameView = false
//
////    static var previews: some View {
////        SelectOpponentView(team: <#TeamModel#>, isShowNewGame: $isShowNewGame, inGameView: $inGameView)
////            .previewInterfaceOrientation(.landscapeRight)
////    }
////}
