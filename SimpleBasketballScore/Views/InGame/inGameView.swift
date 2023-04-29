//
//  inGameView.swift
//  SimpleBasketballScore
//
//  Created by KJ on 3/15/23.
//

import SwiftUI

struct inGameView: View {
    
//    let gameToPlay: GameModel?
    
    lazy var sampleTeam = TeamModel(id: "", name: "", logo: "", win: 0, loss: 0, league: "")
    lazy var gameToPlay = GameModel(opponent_name: "", opponent_logo: "", opponent_league: "", team: sampleTeam )
//
    // for stats buttons
    fileprivate func statButton(name: String) -> some View {
        return NavigationLink(destination: WhoScoreView(stat: name) {
            Text(name)
                .font(.system(size: 50))
                .foregroundColor(.black)
                .frame(width: 170, height: 170)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 85)
                        .stroke(Color(.systemGreen), lineWidth: 3)
                        .shadow(radius: 1, x: 2, y: 2)
                )
                .padding()
        }
    }
    
    var body: some View {
        NavigationView {
            HStack{
                // stats view 1
                VStack{
                    HStack{
                        VStack{
                            statButton(name: "3pt")
                            statButton(name: "2pt")
                            statButton(name: "1pt")
                        }
                        VStack{
                            statButton(name: "3pt")
                            statButton(name: "2pt")
                            statButton(name: "1pt")
                        }
                    } .padding(.horizontal, 50)
                    HStack{
                        Image(systemName: "line.horizontal.3")
                            .font(.system(size: 80))
                            .foregroundColor(Color(.systemGreen))
                            .padding(.top, 50)
                            .padding(.horizontal, 65)
        
                        Image(systemName: "arrow.uturn.backward")
                            .font(.system(size: 70))
                            .foregroundColor(Color(.systemGreen))
                            .padding(.top, 50)
                            .padding(.horizontal, 65)
                        
                    }
                    
                }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                Spacer()
                // timer など
                VStack{
                    ZStack{
                        Rectangle()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(.white)
                            .shadow(color: .gray.opacity(0.2), radius: 10, x: 1, y: 1)
                        VStack(){
                            Text("\(gameToPlay.name ?? "")\t\t60")
                                .font(.system(size: 30))
                                .bold()
                                .padding(.top, 50)
                                .padding(.bottom, 2)
                            Text("\(gameToPlay.opponent_name ?? "")\t\t74")
                                .font(.system(size: 30))
                                .bold()

                            Spacer()
                            Text("12:00")
                                .font(.system(size: 30))
                                .padding(.vertical, 10)
                                .padding(.horizontal, 40)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 3)
                                        .stroke(Color(.systemRed), lineWidth: 3)
                                        .shadow(radius: 1, x: 2, y: 2)
                                )
                                .padding(.bottom, 30)
                                
                        }
                    }
                }
                Spacer()
                //stats view 2
                VStack{
                    HStack{
                        VStack{
                            statButton(name: "Def\n reb")
                            statButton(name: "To")
                            statButton(name: "asst")
                        }
                        VStack{
                            statButton(name: "Off\n reb")
                            statButton(name: "stl")
                            statButton(name: "blk")
                        }
                    }.padding(.horizontal, 50)
                    HStack{
                        Text("subs")
                            .font(.system(size: 50))
                            .foregroundColor(.black)
                            .frame(width: 180, height: 80)
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 180)
                                    .stroke(Color(.systemRed),   lineWidth: 3)
                                    .shadow(radius: 1, x: 2, y: 2)
                            )
                            .padding()
                        Text("foul")
                            .font(.system(size: 50))
                            .foregroundColor(.black)
                            .frame(width: 180, height: 80)
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 180)
                                    .stroke(Color(.systemGreen), lineWidth: 3)
                                    .shadow(radius: 1, x: 2, y: 2)
                            )
                            .padding()
                    }
                    .padding(.top,40)
                }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }
        }
            .navigationViewStyle(StackNavigationViewStyle())
    }
}


//struct inGameView_Previews: PreviewProvider {
//    static var previews: some View {
//        inGameView()
//            .previewInterfaceOrientation(.landscapeRight)
//    }
//}
