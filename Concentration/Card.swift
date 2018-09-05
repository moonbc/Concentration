//
//  Card.swift
//  Concentration
//
//  Created by moonbc on 2018. 9. 6..
//  Copyright © 2018년 moonbc.com. All rights reserved.
//

import Foundation
struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    init(identifier: Int){
        self.identifier = identifier
    }
}
