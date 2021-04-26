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

struct User: Identifiable, Hashable {
    var id: UUID
    var name: String
}

class MyModel: ObservableObject {
    @Published var users: [User] = []
}

struct ContentView: View {
    @State private var isLoading = false
    @State var li: [String] = []
    @ObservedObject var viewModel = MyModel()

    var body: some View {
        VStack {
            
            ForEach(self.viewModel.users) { item in
                Text(item.name)
            }
            
            Button(action: {
                if self.viewModel.users.count == 0 {
                    self.viewModel.users = [
                        User(id: UUID(), name: "zhagnsan"),
                        User(id: UUID(), name: "zhagnsan1"),
                        User(id: UUID(), name: "zhagnsa2"),
                    ]
                } else {
                    self.viewModel.users = [
                        User(id: UUID(), name: "zhagnsan111"),
                        User(id: UUID(), name: "zhagnsan1222"),
                    ]
                }
                
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
            
            Button(action: {
               self.viewModel.users = []
                
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
            
            RefreshableScrollView(refreshing: self.$isLoading) {
                VStack {
                    ForEach(li, id: \.self) { item in
                        Text(item)
                    }
                }
            }
            .onChange(of: self.isLoading, perform: { value in
                print(value, self.isLoading)
                if value {
                    print(self.$isLoading)
                    self.li = ["this", "is", "a", "Test", "Text"]
                    self.isLoading = false
                }
        })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

