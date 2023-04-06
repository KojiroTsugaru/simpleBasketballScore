//
//  boxscoreView.swift
//  SimpleBasketballScore
//
//  Created by KJ on 4/2/23.
//

import SwiftUI

struct boxscoreView: View {
    @ObservedObject var model = PlayerViewModel()
    
    var body: some View {
        VStack{
            ScrollView(.horizontal){
                Table(model.players) {
                    TableColumn("Name"){ p in Text(p.fullname)}
                        .width(150)
                    TableColumn("PTS"){ p in Text("\(p.point)")}
                    TableColumn("REB"){ p in Text("\(p.to_reb)")}
                    TableColumn("AST"){ p in Text("\(p.assist)")}
                    TableColumn("STL"){ p in Text("\(p.steal)")}
                    TableColumn("BLK"){ p in Text("\(p.block)")}
                }.frame(alignment: .trailing)
                .foregroundColor(.black)
                .frame(width:500, height: 600)
            }
            
        }.padding()
    }
    init(){
        model.getData()
    }
}

struct boxscoreView_Previews: PreviewProvider {
    static var previews: some View {
        boxscoreView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
