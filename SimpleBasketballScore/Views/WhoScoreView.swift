//
//  WhoScoreView.swift
//  SimpleBasketballScore
//
//  Created by KJ on 3/25/23.
//

import SwiftUI

struct WhoScoreView: View {
    // player view model
    @ObservedObject var model = PlayerViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    let statTapped: String?
    
    // cell for each player
    fileprivate func playerCellView(player: PlayerModel) -> ZStack<some View> {
        let backgroundColor = player.isOpponent ? Color(.systemRed) : Color(.systemGreen)
        return ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 320, height: 240)
                    .foregroundColor(backgroundColor).opacity(0.5)
                    .overlay {
                        ZStack(){
                            Image(player.picture)
                                .resizable()
                                .clipShape(Circle())
                                .scaledToFit()
                                .frame(height: 250)
                                .offset(x:-65)
                                .padding(.horizontal)
                            VStack{
                                Text("#\(player.number)")
                                    .italic()
                                    .fontWeight(.bold)
                                    .font(.system(size: 50))
                                Text("\(player.firstname)\n\(player.lastname)")
                                    .font(.system(size: 30))
                            }.foregroundColor(.black)
                                .offset(x: 85, y: -20)
                        }
                    }
            }
        }
    
    var body: some View {
        VStack{
            HStack{
                ForEach(model.players) { p in
                    playerCellView(player: p).onTapGesture {
                        model.updateStat(playerUpdate: p, stat: statTapped!)
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            HStack{
                //
            }
            HStack{
                //                    playerCellView(firstName: "Kevin", lastName: "Durant", number: "35", pic: "kevin_durant", isOpponent: false)
                //                    playerCellView(firstName: "Kevin", lastName: "Durant", number: "35", pic: "kevin_durant", isOpponent: false)
                //                    playerCellView(firstName: "Kevin", lastName: "Durant", number: "35", pic: "kevin_durant", isOpponent: false)
                //                    playerCellView(firstName: "Kevin", lastName: "Durant", number: "35", pic: "kevin_durant", isOpponent: false)
                //                }
            }
        }
    }
    
    init(stat: String) {
        self.statTapped = stat
        model.getData()
    }
}
struct WhoScoreView_Previews: PreviewProvider {
    static var previews: some View {
        WhoScoreView(stat: "1pt")
            .previewInterfaceOrientation(.landscapeRight)
    }
}
