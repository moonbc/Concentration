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
    private(set) var cards = [Card]()
    
    private var indexOfOnAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    }else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        //(newvalue)가 없으면 디폴트가 newValue
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)):chosen index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOnAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                cards[index].isFaceUp = true
//                indexOfOnAndOnlyFaceUpCard = nil
            }else {
                //either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
//                indexOfOnAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0 , "Concentration.init(\(numberOfPairsOfCards)): you must have at least on pair of cards")
        for _ in  1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]

        }
        // TODO: Shuffle the cards
        
    }
}
