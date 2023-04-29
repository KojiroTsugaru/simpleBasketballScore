//
//  SelectPlayerView.swift
//  SimpleBasketballScore
//
//  Created by KJ on 4/11/23.
//

import SwiftUI

struct TeamItem: View {
    // team model
    let team: TeamModel
    
    var body: some View {
        HStack(alignment: .top) {
            VStack{
                Text(team.name)
                    .font(.system(size: 24)).bold()
                    .foregroundColor(.black)
                    .padding(.top, 30)
                    .padding(.bottom)
                ForEach(team.games) { g in
                    Text(g.opponent_name)
                        .font(.system(size: 10)).bold()
                        .foregroundColor(.black)
                        .padding()
                }
            }
        }
        .padding(.horizontal, 20)
        .frame(width: 1100, height: 650)
        .background(LinearGradient(colors: [Color(.systemGreen), .white], startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius (25)
        .shadow (color: Color.gray.opacity(0.8), radius: 10, x: 0, y: 8)
    }
}

struct TeamView: View {
    // for creating new team
    @State private var isShowingSheet = false
    @State private var teamname: String = ""
    
    // team model instance
    @ObservedObject var model = TeamViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    Spacer()
                    Text("Select Team")
                        .font(.system(size: 35)).bold()
                        .foregroundColor(.black)
                        .offset(x: 50)
                    Spacer()
                    Button {
                        isShowingSheet.toggle()
                    } label: {
                        Text("New")
                            .foregroundColor(.black).font(.system(size: 35))
                            .padding()
                    }
                }.padding()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            ForEach(model.teams) { t in
                                GeometryReader { geometry in
                                    TeamItem(team: t)
                                        .rotation3DEffect(Angle(degrees: Double (geometry.frame(in: .global).minX) / 50),
                                                          axis: (x: 0, y:0.2, z: 0))
                                    
                                }
                                .frame(width: 1250, height: 800)
                                .frame(alignment: .center)
                            }
                        }.padding(.horizontal, 100)
                            .padding(.top,100)
                    }
                    .padding()
            }
        }.navigationViewStyle(StackNavigationViewStyle())
        
            // sheet to add new teams
            .sheet(isPresented: $isShowingSheet, onDismiss: didDismiss){
                NavigationView {
                    VStack{
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
                            
                            Button("Dismiss", action: { isShowingSheet.toggle() })
                        }
                        Button("Save", action: {
                            model.addTeam(name: teamname, logo: "kevin_durant", league: "NBA")
                            isShowingSheet.toggle()
                        })
                            .padding()
                            .frame(width: 180, height: 80)
                            .background(Color.blue.cornerRadius(25))
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                            .padding()
                    }
                    
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button("Cancel", action: { isShowingSheet.toggle() })
                                .padding()
                                .frame(width: 40, height: 200)
                        }
                    }
                    .navigationTitle("Create New Team")
                    .navigationBarTitleDisplayMode(.large)
                }
            }
        }
        func didDismiss() {
            // Handle the dismissing action.
        }
    }

struct SelectPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView()
            .previewInterfaceOrientation(.landscapeRight)
        
    }
}
