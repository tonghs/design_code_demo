//
//  Home.swift
//  DesignCode01
//
//  Created by 仝华帅 on 2021/3/14.
//

import SwiftUI


let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
var statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0

let screen = UIScreen.main.bounds

struct Home: View {
    @State var show = false
    @State var showProfile = false
    @State var showUpdates = false
    @State var showSettings = false
    
    var body: some View {
        ZStack {
            
            HomeList()
                .blur(radius: show ? 20 : 0)
                .scaleEffect(showProfile ? 0.95 : 1)
                .animation(.default)

            ContentView()
                .frame(minWidth: 0, maxWidth: 712)
                .background(BlurView(style: .systemMaterial))
                .cornerRadius(30)
                .shadow(radius: 20)
                .animation(.spring())
                .offset(y: showProfile ? statusBarHeight + 40 : UIScreen.main.bounds.height)
            
            VStack {
                HStack {
                    MenuButton(show: self.$show)
                        .offset(x: -35, y: showProfile ? statusBarHeight : 78)
                        .animation(.spring())
                    
                    MenuRight(showProfile: self.$showProfile, showUpdates: self.$showUpdates)
                        .offset(x: -16, y: showProfile ? statusBarHeight : 78)
                        .animation(.spring())
                }
                Spacer()
            }

            MenuView(show: self.$show, showUpdates: self.$showUpdates, showSettings: self.$showSettings)
        }
        .background(Color("background"))
        .ignoresSafeArea(.all)
        
        
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // xcrun simctl list devicetypes
            Home().previewDevice("iPhone SE (2nd generation)")
            Home().previewDevice("iPhone 12 mini")
            Home().previewDevice("iPhone XR")
            Home().previewDevice("iPhone 12")
            Home().previewDevice("iPad Pro (9.7-inch)")

        }
    }
}

struct MenuRow: View {
    var image = "creditcard"
    var text = "My Account"
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .foregroundColor(Color("icons"))
                .frame(width: 32, height: 32)
            
            Text(text)
                .font(.headline)
            
            Spacer()
        }
    }
}

struct Menu: Identifiable {
    var id = UUID()
    
    var title: String
    var icon: String
}

let menuData = [
    Menu(title: "My Account", icon: "person.crop.circle"),
    Menu(title: "Settings", icon: "gear"),
    Menu(title: "Billing", icon: "creditcard"),
    Menu(title: "Team", icon: "person.and.person"),
    Menu(title: "Sign out", icon: "arrow.uturn.down")
]

struct MenuView: View {
    var menu = menuData
    @Binding var show : Bool
    @Binding var showUpdates : Bool
    @Binding var showSettings : Bool

    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(menu) { item in
                    if item.title == "Settings" {
                        MenuRow(image: item.icon, text: item.title)
                            .onTapGesture {
                                self.showSettings.toggle()
                            }
                            .sheet(isPresented: self.$showSettings, content: {
                                Settings()
                            })

                    } else {
                        MenuRow(image: item.icon, text: item.title)
                    }
                }
                
                Spacer()
            }
            .padding(.top, 20)
            .padding(30)
            .frame(minWidth: 0, maxWidth: 360)
            .background(Color("button"))
            .cornerRadius(30)
            .padding(.trailing, 60)
            .shadow(radius: 20)
            .rotation3DEffect(
                Angle(degrees: show ? 0 : 60),
                axis: (x: 0, y: 10, z: 0)
            )
            .offset(x: show ? 0 : -UIScreen.main.bounds.width)
            .animation(.default)
            .onTapGesture {
                self.show.toggle()
            }
            Spacer()
        }
        .padding(.top, statusBarHeight)
    }
}

struct CircleButton: View {
    var icon = "person.crop.circle"
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.primary)
        }
        .frame(width: 44, height: 44)
        .background(Color("button"))
        .cornerRadius(30)
        .shadow(color: Color("buttonShadow"), radius: 10, x: 0.0, y: 10.0)
    }
}

struct MenuButton: View {
    @Binding var show : Bool
    var body: some View {
        
        HStack {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
                Button(action: { self.show.toggle() }) {
                    HStack {
                        Spacer()
                        Image(systemName: "list.dash")
                            .foregroundColor(.primary)
                    }
                    .padding(.trailing, 20)
                    .frame(width: 90, height: 60)
                    .background(Color("button"))
                    .cornerRadius(30)
                    .shadow(color: Color("buttonShadow"), radius: 10, x: 0.0, y: 10.0)
                    
                }
                
            }
            Spacer()
        }
    }
}

struct MenuRight: View {
    @Binding var showProfile: Bool
    @Binding var showUpdates: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            Spacer()
            
            HStack {
                Button(action: { self.showProfile.toggle() }) {
                    CircleButton(icon: "person.crop.circle")
                }
                
                Button(action: {self.showUpdates.toggle()}, label: {
                    CircleButton(icon: "bell")
                })
                .sheet(isPresented: self.$showUpdates) {
                    UpdateList()
                }
            }
        }
    }
}
