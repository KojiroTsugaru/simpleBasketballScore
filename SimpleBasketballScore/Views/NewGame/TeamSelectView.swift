//
//  TeamSelectView.swift
//  SimpleBasketballScore
//
//  Created by KJ on 4/13/23.
//

import SwiftUI

struct TeamSelectView: View {
    @ObservedObject var model = TeamViewModel()
    @Binding var isShowNewGame: Bool
    @Binding var inGameView: Bool
    
    var body: some View {
            List(model.teams){ t in
                NavigationLink {
                    SelectOpponentView(isShowNewGame: $isShowNewGame, inGameView: $inGameView, teamSelected: t)
                } label: {
                    HStack{
                        Image(t.logo)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150)
                            .clipShape(Circle())
                        VStack(alignment: .leading){
                            Text(t.name)
                                .font(.system(size: 30))
                            Text(t.league)
                                .font(.title2)
                        }
                    }
                        .foregroundColor(.black)
                }
            }
    }
}

struct TeamSelectView_Previews: PreviewProvider {
    @State static var isShowNewGame = true
    @State static var inGameView = false
    
    static var previews: some View {
        TeamSelectView(isShowNewGame: $isShowNewGame, inGameView: $inGameView)
            .previewInterfaceOrientation(.landscapeRight)
        }
    }
