//
//  boxscoreView.swift
//  SimpleBasketballScore
//
//  Created by KJ on 4/2/23.
//

import SwiftUI

struct HalfRect: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        // right side
        path.move(to: CGPoint(x: rect.maxX/2+90, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX/2-90, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        
        // left side
        path.move(to: CGPoint(x: rect.maxX/2+75, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX/2-105, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.minY))
        return path
    }
}

struct boxscoreView: View {
    @ObservedObject var model = PlayerViewModel()
    
    var body: some View {
        VStack{
            HalfRect()
                .foregroundColor(.blue.opacity(0.2))
                .frame(maxWidth: .infinity)
                .frame(height: 350)
            VStack{
                Rectangle()
                    .frame(width: .infinity, height: 30)
                    .foregroundColor(.black).opacity(0.2)
                // boxscore for our team
                ScrollView(.horizontal){
                    Table(model.players) {
                        TableColumn("Name"){ p in Text(p.fullname)}
                            .width(150)
                        TableColumn("PTS"){ p in Text("\(p.point)")}
                        TableColumn("REB"){ p in Text("\(p.to_reb)")}
                        TableColumn("AST"){ p in Text("\(p.assist)")}
                        TableColumn("STL"){ p in Text("\(p.steal)")}
                        TableColumn("BLK"){ p in Text("\(p.block)")}
                        TableColumn("PTS"){ p in Text("\(p.point)")}
                        TableColumn("REB"){ p in Text("\(p.to_reb)")}
                        TableColumn("AST"){ p in Text("\(p.assist)")}
                        TableColumn("STL"){ p in Text("\(p.steal)")}
                    }.frame(alignment: .trailing)
                    .foregroundColor(.black)
                    .frame(width:1900, height: 200)
                    .scaledToFit()
                }
                Rectangle()
                    .frame(width: .infinity, height: 30)
                    .foregroundColor(.black).opacity(0.2)
                // boxscore for opponent
                ScrollView(.horizontal){
                    Table(model.players) {
                        TableColumn("Name"){ p in Text(p.fullname)}
                            .width(150)
                        TableColumn("PTS"){ p in Text("\(p.point)")}
                        TableColumn("REB"){ p in Text("\(p.to_reb)")}
                        TableColumn("AST"){ p in Text("\(p.assist)")}
                        TableColumn("STL"){ p in Text("\(p.steal)")}
                        TableColumn("BLK"){ p in Text("\(p.block)")}
                        TableColumn("PTS"){ p in Text("\(p.point)")}
                        TableColumn("REB"){ p in Text("\(p.to_reb)")}
                        TableColumn("AST"){ p in Text("\(p.assist)")}
                        TableColumn("STL"){ p in Text("\(p.steal)")}
                    }.frame(alignment: .trailing)
                    .foregroundColor(.black)
                    .frame(width:1900, height: 200)
                }
                
            }
            Spacer()
        }
        .ignoresSafeArea(.all)
//        .padding()
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
