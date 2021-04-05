//
//  CoreDateTestApp.swift
//  CoreDateTest
//
//  Created by 仝华帅 on 2021/4/5.
//

import SwiftUI

@main
struct CoreDateTestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
