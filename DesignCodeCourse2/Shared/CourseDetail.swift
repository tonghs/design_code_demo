//
//  CourseDetail.swift
//  DesignCodeCourse
//
//  Created by 仝华帅 on 2021/3/18.
//

import SwiftUI

struct CourseDetail: View {
    var course: Course = courses[0]
    var namespace: Namespace.ID
    
    #if os(iOS)
    var cornerRadius: CGFloat = 10
    #else
    var cornerRadius: CGFloat = 0
    #endif
    
    @State var showModel = false
    
    var body: some View {
            #if os(iOS)
                content.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            #else
                content
            #endif
    }
    
    var content: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                CourseItem(course: course, cornerRadius: 0)
                    .matchedGeometryEffect(id: course.id, in: namespace)
                    .frame(height: 300)
                    
                VStack {
                    ForEach(courseSections) { item in
                        CourseRow(item: item)
                            .sheet(isPresented: $showModel) {
                                CourseSectionDetail()
                            }
                            .onTapGesture {
                                showModel = true
                            }
                        Divider()
                    }
                }.padding()
            }
        }
        .background(Color("Background 1"))
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
        .matchedGeometryEffect(id: "container\(course.id)", in: namespace)
    }
}

struct CourseDetail_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        CourseDetail(namespace: namespace)
    }
}
