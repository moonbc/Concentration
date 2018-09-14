//
//  ViewController.swift
//  Concentration
//
//  Created by moonbc on 2018. 9. 4..
//  Copyright © 2018년 moonbc.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    
    //get { } 만 있는 경우에는 생략 가능
    var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }
    
    private(set) var filpCount = 0 {
        //fileCount가 변할 때 마다 라벨을 업데이트시킨다.
        didSet {
            let attributes: [NSAttributedStringKey:Any] = [
                .strokeWidth : 5.0,
                .strokeColor : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            ]
            let attributedString = NSAttributedString(string: "Flips: \(filpCount)", attributes: attributes)
            
            flipCountLabel.attributedText = attributedString
        }
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
    

    
    @IBAction private func touchCard(_ sender: UIButton) {
        filpCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else {
            print("chosen card was not in cardButtons")
        }

    }

    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                 button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
//    private var emojiChoices = ["🎃", "👻", "🦁", "🍐", "🌶", "🍳", ",🥔", "🥦"]
    private var emojiChoices = "🎃👻🦁🍐🌶🍳🥔🥦"
    
    private var emoji = [Card:String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil , emojiChoices.count > 0{
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
        
        return emoji[card] ?? "?"
    }
    

}


extension Int {
    var arc4random: Int {
        if self > 0 {
        return Int(arc4random_uniform(UInt32(self)))
        }else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }else  {
            return 0
        }
    }
}
