//
//  Hausarbeit_Marco_BentzApp.swift
//  Hausarbeit_Marco_Bentz
//
//  Created by Marco Bentz on 07.06.21.
//

import SwiftUI

@main
struct Hausarbeit_Marco_BentzApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
