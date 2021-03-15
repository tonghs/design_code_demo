//
//  HomeList.swift
//  DesignCode01
//
//  Created by 仝华帅 on 2021/3/14.
//

import SwiftUI

struct HomeList: View {
    @State var isPresented = false
    var courses = coursesData
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Courses")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        Text("22 courses")
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding(.leading, 60.0)
                .padding(.bottom, 10)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 30) {
                        ForEach(courses) { item in
                            
                            GeometryReader { geometry in
                                CourseView(
                                    title: item.title,
                                    image: item.image,
                                    color: item.color,
                                    shadowColor: item.shadowColor)
                                    
                                    .sheet(isPresented: $isPresented, content: {
                                        ContentView()
                                    })
                                    .onTapGesture {
                                        self.isPresented.toggle()
                                        
                                    }
                                    .rotation3DEffect(Angle(degrees:
                                                                Double(geometry.frame(in: .global).minX - 40) / -40
                                    ), axis: (x: 0, y: 10.0, z: 0))
                            }
                            .frame(width: 246, height: 360)
                        }
                    }
                    .padding(.leading, 30)
                    .padding(.top, 30)
                    .padding(.bottom, 70)
                    
                    Spacer()
                }
                
                CertificateRow()
            }
            .padding(.top, 78.0)
            .padding(.bottom, 90.0)
        }
        
    }
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}

struct CourseView: View {
    var title: String
    var image: String
    var color: Color
    var shadowColor: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(30)
                .lineLimit(4)
                .padding(.trailing, 30)
            Spacer()
            Image(self.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 246, height: 150)
                .padding(.bottom, 30)
        }
        .background(self.color)
        .cornerRadius(30)
        .frame(width: 246, height: 360, alignment: .center)
        .shadow(color: self.shadowColor, radius: 20, x: 0, y: 20)
    }
}

struct Course: Identifiable {
    var id = UUID()
    
    var title: String
    var image: String
    var color: Color
    var shadowColor: Color
}

let coursesData = [
    Course(
        title: "Build an app with SwiftUI",
        image: "Illustration1",
        color: Color("background3"),
        shadowColor: Color("backgroundShadow3")),
    Course(
        title: "Build another app with SwiftUI",
        image: "Illustration2",
        color: Color("background4"),
        shadowColor: Color("backgroundShadow4")),
    Course(
        title: "Build an app with SwiftUI",
        image: "Illustration3",
        color: Color("background5"),
        shadowColor: Color("backgroundShadow3")),
    Course(
        title: "Build another app with SwiftUI",
        image: "Illustration4",
        color: Color("background6"),
        shadowColor: Color("backgroundShadow4")),
    Course(
        title: "Build another app with SwiftUI",
        image: "Illustration5",
        color: Color("background7"),
        shadowColor: Color("backgroundShadow4"))
]
