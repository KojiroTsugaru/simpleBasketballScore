//
//  HomeView.swift
//  SimpleBasketballScore
//
//  Created by KJ on 4/6/23.
//

import SwiftUI

struct HomeView: View {
    // for sheet
    @State private var isShowNewGame = false
    
    // to move to inGame view after game setting
    @State private var inGameView = false
    
    @State private var teamname: String = ""
    @ObservedObject var model = PlayerViewModel()
    
    // for score on the top
    @State private var ally_score: Int = 0
    @State private var opponent_score: Int = 0
    
    init() {
        model.getData()
    }
    
    var body: some View {
        if !self.inGameView {
            NavigationView {
                HStack{
                    VStack{
                        Image(systemName: "basketball.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250)
                            .padding()
                            .offset(x: -100)
                            .foregroundColor(Color(.systemGreen))
                        Text("Simple Basketball Score")
                            .offset(x: -100)
                            .font(.system(size: 35))
                    }
                    VStack{
                        Button {
                            isShowNewGame.toggle()
                        } label: {
                            Text("New Game")
                                .font(.system(size: 40))
                                .foregroundColor(.black)
                                .frame(width: 300, height: 100)
                                .foregroundColor(.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 85)
                                        .stroke(Color(.systemGreen), lineWidth: 3)
                                        .shadow(radius: 1, x: 2, y: 2)
                                )
                                .padding()
                        }
                        NavigationLink {
                            TeamView()
                        } label: {
                            Text("Teams")
                                .font(.system(size: 40))
                                .foregroundColor(.black)
                                .frame(width: 300, height: 100)
                                .foregroundColor(.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 85)
                                        .stroke(Color(.systemGreen), lineWidth: 3)
                                        .shadow(radius: 1, x: 2, y: 2)
                                )
                                .padding()
                        }
                        NavigationLink {
                            TeamView()
                        } label: {
                            Text("Go Pro+")
                                .font(.system(size: 40))
                                .foregroundColor(.black)
                                .frame(width: 300, height: 100)
                                .foregroundColor(.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 85)
                                        .stroke(Color(.systemGreen), lineWidth: 3)
                                        .shadow(radius: 1, x: 2, y: 2)
                                )
                                .padding()
                        }
                    }.offset(x: 80)
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
            
            .sheet(isPresented: $isShowNewGame, onDismiss: nil){
                NavigationView {
                    TeamSelectView(isShowNewGame: $isShowNewGame, inGameView: $inGameView)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button("Cancel", action: { isShowNewGame.toggle() })
                                .padding()
                                .frame(width: 40, height: 200)
                        }
                    }
                    .navigationTitle("Start New Game")
                }
            }
        }
        else { SimpleBasketballScore.inGameView() }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
