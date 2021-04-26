//
//  ContentView.swift
//  Shared
//
//  Created by 仝华帅 on 2021/4/25.
//

import SwiftUI

//struct ContentView: View {
//    @State var isShow = false
//    @Namespace private var ns
//
//    var body: some View {
//        VStack {
//            if isShow {
//                Circle()
//                    .matchedGeometryEffect(id: "large1", in: ns)
//                    .frame(width: 200, height: 200)
//            } else {
//                RoundedRectangle(cornerRadius: 25.0)
//                    .matchedGeometryEffect(id: "large1", in: ns)
//                    .frame(width: 100, height: 100)
//            }
//            Button("test") {
//                withAnimation() {
//                    self.isShow.toggle()
//                }
//            }
//        }
//    }
//}

struct ContentView: View {
    @Namespace private var animation
    @State private var isFlipped = false

    var body: some View {
        ZStack {
            if isFlipped {
                VStack {
                    Image("drink")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .matchedGeometryEffect(id: "Shape", in: animation)
                        .frame(width: 200, height: 200)
                }
//                .transition(.modal)
            }
            
            if !isFlipped {
                VStack {
                    Spacer()
                    Image("drink")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .matchedGeometryEffect(id: "Shape", in: animation)
                        .frame(width: 100, height: 100)
//                        .clipShape(Rectangle())
                        .contentShape(Circle())
//                            .animation(.easeIn)
//                            .transition(.invisible)
                }
                .transition(.invisible)
            }
        }
        .onTapGesture {
            withAnimation(.easeInOut(duration: 1)) {
                isFlipped.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

