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
        case hearts = "♥️❤️"
        case diamonds = "♦️"
        case clubs = "♣️"
        
        static var all = [Suit.spades, .hearts ,.diamonds , .clubs ]
    }
    enum Rank {
        case ace
        case face(String)
        case numeric(Int)
        
        var order: Int {
            switch self {
            case .numeric(let pips): return pips
            case .face(let kind) where kind == "J" : return 11
            case .face(let kind) where kind == "Q" : return 12
            case .face(let kind) where kind == "K" : return 13
            default: return 0
            }
        }
        
        static var all: [Rank] {
            var allRanks = [Rank.ace]
            for pips in 2...10 {
                allRanks.append(Rank.numeric(pips))
            }
            
            allRanks += [ Rank.face("J"),Rank.face("Q"), Rank.face("K") ]
            
            return allRanks
        }
    }
    

}

