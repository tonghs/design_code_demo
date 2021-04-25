//
//  ContentView.swift
//  Shared
//
//  Created by 仝华帅 on 2021/4/25.
//

import SwiftUI

struct ContentView: View {
    @State var isShow = false
    @Namespace private var ns
    
    var body: some View {
        ZStack {
            if !isShow {
                Color.clear.overlay(
                    SubView()
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 1)) {
                                DispatchQueue.main.async {
                                    withAnimation(.easeInOut(duration: 1)) {
                                        self.isShow = true
                                    }
                                }
                            }
                        }
                        .matchedGeometryEffect(id: "large1", in: ns, properties: .frame)
                        .transition(.invisible)
                        
                )
                .zIndex(1)
            } else {
                Color.clear.frame(width: 150, height: 128)
                
                Color.clear.overlay(
                    SubView2()
                        .onTapGesture {
                            DispatchQueue.main.async {
                                withAnimation(.easeInOut(duration: 1)) {
                                    self.isShow = false
                                }
                            }
                        }
                        .matchedGeometryEffect(id: "large1", in: ns, properties: .position)
                        .transition(.modal)

                )
                .zIndex(3)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SubView: View {
    var body: some View {
        Image("icon")
            .resizable()
            .frame(width: 150, height: 128)
    }
}

struct SubView2: View {
    var body: some View {
        Image("icon")
            .resizable()
            .frame(width: 300, height: 256)
            .offset(y: -100)
    }
}
