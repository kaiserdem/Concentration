//
//  ViewController.swift
//  ConcentrationApp
//
//  Created by Kaiserdem on 27.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = ConcentrationGame(numberOfPairsOfCard: numberOfPairsOfCard)
    
    var numberOfPairsOfCard: Int {
        return (buttonCollection.count + 1) / 2
    }
    
    private var emojiCollection = ["🦊","🐰","🐶","🦁","🐨","🐸","🦉","🦇","🐺","🐝","🦖","🐿","🐓","🐂","🐫","🐋","🐌"]
    private var emojiDictionary = [Card: String]()
    
    private(set) var touches = 0 {
        didSet {
            touchLabel.text = "Touches: \(touches)"
        }
    }
    
    private func emojiIdentifier(for card: Card) -> String {
        if emojiDictionary[card] == nil {
            emojiDictionary[card] = emojiCollection.remove(at: emojiCollection.count.arc4Random)
        }
        return emojiDictionary[card] ?? "?"
    }
    
    
    private func updateViewFromModel() {
        for index in buttonCollection.indices {
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiIdentifier(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0, green: 0.4800176024, blue: 1, alpha: 1)
            }
        }
    }
    
    @IBOutlet private weak var touchLabel: UILabel!
    @IBOutlet private var buttonCollection: [UIButton]!
    @IBAction private func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            game.chooseCard(at: buttonIndex)
            updateViewFromModel()
            
        }
    }
    
}

extension Int {
    
    var arc4Random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if  self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}
