//
//  TabBar.swift
//  DesignCode01
//
//  Created by 仝华帅 on 2021/3/14.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView(selection: .constant(1)) {
            Home().tabItem {
                VStack {
                    Image(systemName: "house")
                    Text("Home")
                }
                .padding(.bottom, 200)
            }.tag(1)
            
            ContentView().tabItem {
                VStack {
                    Image(systemName: "giftcard")
                    Text("Cards")
                }
            }.tag(2)
            
            UpdateList().tabItem {
                VStack {
                    Image(systemName: "list.dash")
                    Text("Update List")
                }
            }.tag(3)
            
            Settings().tabItem {
                VStack {
                    Image(systemName: "gear")
                    Text("Settings")
                }
            }.tag(4)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            Group {
                // xcrun simctl list devicetypes
//                TabBar().previewDevice("iPhone SE (2nd generation)")
//                TabBar().previewDevice("iPhone 12 mini")
//                TabBar().previewDevice("iPhone XR")
                TabBar().previewDevice("iPhone 12")
                TabBar().previewDevice("iPad Pro (9.7-inch)")

            }
            
//            TabBar()
//                .environment(\.colorScheme, .dark)
//
//            TabBar()
//                .environment(\.sizeCategory, .extraLarge)
        }
        
    }
}
