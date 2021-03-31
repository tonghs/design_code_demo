//
//  MemroyGame.swift
//  Memorize
//
//  Created by 仝华帅 on 2021/3/31.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        let chosenIndex = self.index(of: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }
    
    func index(of card: Card) -> Int {
        for idx in  0 ..< self.cards.count {
            if self.cards[idx].id == card.id {
                return idx
            }
        }
        
        return -1  // TODO: bogus
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        self.cards = Array<Card>()
        
        for pairIndex in 0 ..< numberOfPairsOfCards {
            let content: CardContent = cardContentFactory(pairIndex)
            self.cards.append(Card(content: content, id: pairIndex * 2))
            self.cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
