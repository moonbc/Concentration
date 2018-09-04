//
//  ViewController.swift
//  Concentration
//
//  Created by moonbc on 2018. 9. 4..
//  Copyright © 2018년 moonbc.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var filpCount = 0 {
        //fileCount가 변할 때 마다 라벨을 업데이트시킨다.
        didSet {
            flipCountLabel.text = "Flips: \(filpCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        filpCount += 1
        flipCard(withEmoji: "👻", on: sender)
        print("agh! ahost!")
    }
    
    @IBAction func touchSecondCard(_ sender: UIButton) {
        filpCount += 1
        flipCard(withEmoji: "🎃", on: sender)
    }
    
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        print("flipCard(withEmoji: \(emoji)")
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor =  #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        
    }
}

