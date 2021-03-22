//
//  TabBar.swift
//  DesignCode3rd
//
//  Created by 仝华帅 on 2021/3/21.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            CourseList()
                .tabItem {
                    Image(systemName: "play.circle.fill")
                    Text("Course List")
                }
            ContentView()
                .tabItem {
                    Image(systemName: "rectangle.stack.fill")
                    Text("Certificates")
                }
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
//            TabBar().previewDevice("iPhone 8")
            TabBar().previewDevice("iPhone 12")
        }
    }
}
