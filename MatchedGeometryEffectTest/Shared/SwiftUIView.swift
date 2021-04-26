//
//  SwiftUIView.swift
//  MatchedGeometryEffectTest
//
//  Created by 仝华帅 on 2021/4/26.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var isFlipped = false
    @State var selectedId = "s1"

    @Namespace private var animation
    var duration: Double = 1
    
    var body: some View {
        ZStack {
            if !isFlipped {
                HStack {
                    ImageItemView(duration: duration, id: "s1", isFlipped: $isFlipped, selectedId: self.$selectedId)
                        .matchedGeometryEffect(id: "s1", in: animation)
                        .frame(width: 100, height: 100, alignment: .center)
                    
                    ImageItemView(duration: duration, id: "s2", isFlipped: $isFlipped, selectedId: self.$selectedId)
                        .matchedGeometryEffect(id: "s2", in: animation)
                        .frame(width: 100, height: 100, alignment: .center)
                    
                    ImageItemView(duration: duration, id: "s3", isFlipped: $isFlipped, selectedId: self.$selectedId)
                        .matchedGeometryEffect(id: "s3", in: animation)
                        .frame(width: 100, height: 100, alignment: .center)
                }
                
            }
            
            if isFlipped {
                SubView(duration: duration, isFlipped: $isFlipped)
                    .matchedGeometryEffect(id: self.selectedId, in: animation, properties: .frame)
                .frame(width: 300, height: 200, alignment: .center)
                    .zIndex(10)
                
                Spacer()
            }
        }
        
    }
}

struct SubView: View {
    var duration: Double
    @Binding var isFlipped: Bool
    
    var body: some View {
        VStack {
            VStack {
                Color.clear.overlay (
                    Image("drink")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: duration)) {
                                self.isFlipped.toggle()
                            }
                        }
                )
            }
            .clipped()
            .contentShape(Rectangle())
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}

struct ImageItemView: View {
    var duration: Double
    var id: String
    @Binding var isFlipped: Bool
    @Binding var selectedId: String
    
    var body: some View {
        VStack {
            VStack {
                Color.clear.overlay (
                    Image("drink")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .onTapGesture {
                            self.selectedId = id
                            withAnimation(.easeInOut(duration: duration)) {
                                self.isFlipped.toggle()
                            }
                        }
                )
            }
            .clipped()
            .contentShape(Rectangle())
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            
        }
    }
}
