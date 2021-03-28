//
//  ViewController.swift
//  ConcentrationApp
//
//  Created by Kaiserdem on 27.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    var touches = 0 {
        didSet {
            touchLabel.text = "Touches: \(touches)"
        }
    }
    
    
    func flipButton(emoji: String, button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 0, green: 0.4800176024, blue: 1, alpha: 1)
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    let emojiCollection = ["🦊","🐰","🦊","🐰"]

    @IBOutlet weak var touchLabel: UILabel!
    @IBOutlet var buttonCollection: [UIButton]!
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            print(buttonIndex)
            flipButton(emoji: emojiCollection[buttonIndex], button: sender)
        }
    }
    
}

