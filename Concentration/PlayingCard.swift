//
//  PlayingCard.swift
//  Concentration
//
//  Created by moonbc on 2018. 9. 18..
//  Copyright © 2018년 moonbc.com. All rights reserved.
//

import Foundation

struct PlayingCard
{
    var suit: Suit
    var rank: Rank
    
    enum Suit: String {
        
        case spades = "♠️"
        case hearts = "♥️"
        case diamonds = "♦️"
        case clubs = "♣️"
    }
    enum Rank {
        
    }

}

