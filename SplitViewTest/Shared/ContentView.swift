//
//  ContentView.swift
//  Shared
//
//  Created by 仝华帅 on 2021/4/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(0 ..< 5) { item in
                NavigationLink(destination:
                    Text("hello word \(item)")
                ) {
                    Text("hi")
                }
            }
            .navigationBarTitle("Requests")
            
            Text("Nothing Selected.")
        }
        .padding(.leading, 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
