//
//  UpdateDetail.swift
//  DesignCode3rd
//
//  Created by 仝华帅 on 2021/3/21.
//

import SwiftUI

struct UpdateDetail: View {
    var update: Update = updateData[0]
    
    var body: some View {
        ScrollView {
            VStack {
                Image(update.image)
                
                Text(update.text)
            }
            .navigationBarTitle(update.title)
        }
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
