//
//  selectDifficultyViewController.swift
//  iGuess
//
//  Created by Caleb Ogles on 10/11/18.
//  Copyright © 2018 Caleb Ogles. All rights reserved.
//

import UIKit

class SelectDifficultyViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let guessingGameViewController = segue.destination as? ViewController else { return }
        
        switch segue.identifier {
        case "EasyToGuessingGame":
            //Min 1
            //Max 50
            //# guesses 5
            
            guessingGameViewController.maximum = 50
            
        case "MediumToGuessingGame":
            //min 1
            //max 100
            //# of guesses 5
            
            guessingGameViewController.maximum = 100
            
        case "HardToGuessingGame":
            //min 1
            //max 500
            //# of guesses 5
            
            guessingGameViewController.maximum = 500
            
        default:
            break
        }
        
    }
    
}
