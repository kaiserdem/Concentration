//
//  Card.swift
//  ConcentrationApp
//
//  Created by Kaiserdem on 28.03.2021.
//

import Foundation

struct Card: Hashable {
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    func hash(into hashar: inout Hasher) {
        hashar.combine(identifier)
    }
    
    static func ==(lhs:Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    private static var identifierNumber  = 0
    
    private static func identifierGenerator() -> Int {
        identifierNumber += 1
        return  identifierNumber
    }
    
    init() {
        self.identifier = Card.identifierGenerator()
    }
}
