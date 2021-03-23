//
//  DesignCode3rdApp.swift
//  DesignCode3rd
//
//  Created by 仝华帅 on 2021/3/20.
//

import SwiftUI
import Firebase

@main
struct DesignCode3rdApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            TabBar().environmentObject(UserStore())
        }
    }
}
