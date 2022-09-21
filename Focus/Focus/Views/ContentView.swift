//
//  ContentView.swift
//  Focus
//
//  Created by 仝华帅 on 2022/9/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea()
            ZStack {
                Circle()
                    .foregroundColor(Color.accentColor)
                    .opacity(0.44)
                    .frame(width: 200, height: 200)
                Circle()
                    .foregroundColor(Color.accentColor)
                    .opacity(0.44)
                    .position(x: 180, y: 32)
                    .frame(width: 200, height: 200)
            }
            .position()
            
            VStack {
                Spacer()
                
                Image("StartScreenMain")
                    .resizable()
                    .frame(width: 192, height: 174)
                    .padding(.top, 100)
                
                HStack(spacing: 0) {
                    Text("Get things Done with")
                        .padding(/*@START_MENU_TOKEN@*/.top, 85.0/*@END_MENU_TOKEN@*/)
                        .font(.headline)
                    Text(" Focus")
                        .padding(/*@START_MENU_TOKEN@*/.top, 85.0/*@END_MENU_TOKEN@*/)
                        .font(.headline)
                        .foregroundColor(Color.accentColor)
                    
                    if #available(iOS 16, *) {
                        if Locale.current.language.languageCode?.identifier == "zh" {
                            Text("Stay focused")
                                .padding(/*@START_MENU_TOKEN@*/.top, 85.0/*@END_MENU_TOKEN@*/)
                                .font(.headline)
                        }
                    } else {
                        if Locale.current.languageCode == "zh" {
                            Text("Stay focused")
                                .padding(/*@START_MENU_TOKEN@*/.top, 85.0/*@END_MENU_TOKEN@*/)
                                .font(.headline)
                            }
                            
                    }
                }
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lacus netus elit risus tincidunt non ante.")
                    .font(.footnote)
                    .padding(.top, 43)
                    .frame(width: 214)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 43)
                    
                Button(action: {}) {
                    Text("Get Started")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                }
                .padding(.vertical, 20)
                .background(Color.accentColor)

                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.locale, .init(identifier: "zh-Hans"))
        
        ContentView()
            .environment(\.locale, .init(identifier: "en"))
    }
}
