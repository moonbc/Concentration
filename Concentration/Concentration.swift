//
//  Concentration.swift
//  Concentration
//
//  Created by moonbc on 2018. 9. 6..
//  Copyright © 2018년 moonbc.com. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    
    func chooseCard(at index: Int) {
        
    }
    
    init(numberOfPairsOfCards: Int) {
        for identifier in  1...numberOfPairsOfCards {
            let card = Card(identifier: identifier)
//            let matchingCard = card
            cards += [card, card]
//            cards.append(card)
//            cards.append(matchingCard)
            
        }
    }
}
