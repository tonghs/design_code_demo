//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by 仝华帅 on 2021/3/31.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack() {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
        }
        .padding()
        .foregroundColor(Color.orange)
        .font(.largeTitle)
    }
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill()
                    .foregroundColor(.white)

                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(lineWidth: 3)
                Text(card.content)
                
            } else {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill()
            }
        }
    }
}




















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
