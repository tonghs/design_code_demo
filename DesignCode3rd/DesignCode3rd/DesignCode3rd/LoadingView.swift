//
//  LoadingView.swift
//  DesignCode3rd
//
//  Created by 仝华帅 on 2021/3/22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        LottieView(filename: "loading")
            .frame(width: 200, height: 200)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
