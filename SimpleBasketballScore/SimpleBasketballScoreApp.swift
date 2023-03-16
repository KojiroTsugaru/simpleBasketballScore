//
//  SimpleBasketballScoreApp.swift
//  SimpleBasketballScore
//
//  Created by KJ on 3/15/23.
//

import SwiftUI

@main
struct SimpleBasketballScoreApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
