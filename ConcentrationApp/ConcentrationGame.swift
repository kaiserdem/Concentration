//
//  ConcentrationGame.swift
//  ConcentrationApp
//
//  Created by Kaiserdem on 28.03.2021.
//

import Foundation

struct ConcentrationGame {
    
    private(set) var cards = [Card]()
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get{
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchedIndex = indexOfOneAndOnlyFaceUpCard, matchedIndex != index {
                if cards[matchedIndex] == cards[index] {
                    cards[matchedIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true

            } else {
                 indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCard: Int) {
        assert(numberOfPairsOfCard > 0, "ConcentrationGame init(\(numberOfPairsOfCard) mast have at last one pair of cards")
        for _ in 1...numberOfPairsOfCard {
            let card = Card()
            cards += [card, card]

        }
    }
    
}
