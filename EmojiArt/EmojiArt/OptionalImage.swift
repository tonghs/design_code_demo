//
//  OptionalImage.swift
//  EmojiArt
//
//  Created by 仝华帅 on 2021/4/3.
//

import SwiftUI

struct OptionalImage: View {
    var uiImage: UIImage?
    
    var body: some View {
        Group {
            if uiImage != nil {
                Image(uiImage: uiImage!)
            }
        }
    }
}
