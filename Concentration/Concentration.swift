//
//  Concentration.swift
//  Concentration
//
//  Created by moonbc on 2018. 9. 6..
//  Copyright © 2018년 moonbc.com. All rights reserved.
//

import Foundation

struct Concentration
{
    private(set) var cards = [Card]()
    
    private var indexOfOnAndOnlyFaceUpCard: Int? {
        get {

            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
            
        }
        //(newvalue)가 없으면 디폴트가 newValue
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)):chosen index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOnAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                cards[index].isFaceUp = true
//                indexOfOnAndOnlyFaceUpCard = nil
            }else {

                indexOfOnAndOnlyFaceUpCard = index
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

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}

