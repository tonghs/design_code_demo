//
//  ContentView.swift
//  DesignCode01
//
//  Created by 仝华帅 on 2021/3/14.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var viewState = CGSize.zero
    @State var isBlurBackground = false
    
    var body: some View {
        ZStack {

            // BlurView(blurStyle: .regular)

            TitleView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
                
            CardBottomView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)

            CardView()
                .background(show ? Color.red : Color("background10"))
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -5)
                .scaleEffect(0.85)
                .rotationEffect(Angle(degrees: show ? 15 : 0))
                .rotation3DEffect(Angle(degrees: show ? 50 : 0), axis: /*@START_MENU_TOKEN@*/(x: 10.0, y: 10.0, z: 10.0)/*@END_MENU_TOKEN@*/)
                .blendMode(.hardLight)
                .animation(Animation.easeInOut(duration: 0.5))
                .offset(x: viewState.width, y: viewState.height)



            CardView()
                .background(show ? Color.blue : Color("background8"))
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : 15)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: show ? 10 : 0))
                .rotation3DEffect(Angle(degrees: show ? 40: 0), axis: (x: 10.0, y: 10.0, z: 10.0))
                .animation(Animation.easeInOut(duration: 0.5))
                .blendMode(.hardLight)
                .offset(x: viewState.width, y: viewState.height)



            CertificateView()
                .offset(x: 0, y: show ? 0 : 35)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 5 : 0))
                .rotation3DEffect(Angle(degrees: show ? 30 : 0), axis: /*@START_MENU_TOKEN@*/(x: 10.0, y: 10.0, z: 10.0)/*@END_MENU_TOKEN@*/)
                .animation(.easeInOut(duration: 0.5))
                .offset(x: viewState.width, y: viewState.height)
                .onTapGesture {
                    self.show.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            self.viewState = value.translation
                            self.show = true
                        }
                        .onEnded { value in
                            self.viewState = CGSize.zero
                            self.show = false
                        }
                )
        }
        .background(self.isBlurBackground ? nil : Color("background"))
        .background(self.isBlurBackground ? BlurView(blurStyle: .regular) : nil)
        .ignoresSafeArea(.all)
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            Text("Card Back")
        }
        .frame(width: 300.0, height: 200.0)
        
    }
}

struct CertificateView: View {
    var item = Certificate(title: "UI Design", image: "Background", width: 300, height: 200)
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color("accent"))
                        .padding(.top)
                    Text("Certification")
                        .foregroundColor(.white)
                        .padding(.top, 2)
                }
                Spacer()
                Image("Logo")
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
            }
            .padding(.horizontal)
            Spacer()
            Image(item.image)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .offset(y: 50)
        }
        .frame(width: item.width, height: item.height)
        .background(Color.black)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.top, statusBarHeight)
                Spacer()
                
            }.padding(.bottom, 30)
            Image("Illustration5")
            Spacer()
        }
        .padding()
    }
}

struct CardBottomView: View {
    var body: some View {
        VStack(spacing: 20.0) {
            Rectangle()
                .frame(width: 60, height: 6)
                .cornerRadius(3.0)
                .opacity(0.1)
            
            Text("Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.")
                .lineLimit(10)
            
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .padding(.horizontal)
        .background(BlurView(blurStyle: .systemMaterial))
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(y: UIScreen.main.bounds.height - 240)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
