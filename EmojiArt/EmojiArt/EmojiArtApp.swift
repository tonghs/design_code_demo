//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by 仝华帅 on 2021/4/3.
//

import SwiftUI

@main
struct EmojiArtApp: App {

    var body: some Scene {
        
        WindowGroup {
//            EmojiArtDocumentView(document: EmojiArtDocument())
            EmojiArtDocumentChooser().environmentObject(EmojiArtDocumentStore())
        }
    }
}
