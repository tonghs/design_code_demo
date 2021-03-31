//
//  MemorizeApp.swift
//  Memorize
//
//  Created by 仝华帅 on 2021/3/31.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: EmojiMemoryGame())
        }
    }
}
