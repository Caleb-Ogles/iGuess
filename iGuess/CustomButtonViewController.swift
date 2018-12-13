//
//  CustomButtonViewController.swift
//  iGuess
//
//  Created by Caleb Ogles on 10/15/18.
//  Copyright © 2018 Caleb Ogles. All rights reserved.
//

import UIKit

class CustomButtonViewController: UIViewController {
    
        // MARK: UI Outlets
    @IBOutlet weak var lowerBound: UITextField!
    @IBOutlet weak var upperBound: UITextField!
    @IBOutlet weak var customGuesses: UITextField!
    
    override func viewDidLoad() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let guessingGameViewController = segue.destination as? ViewController else {
            return
        }
        
        let customMinimum = lowerBound.text!
        let lowerBoundText = Int(customMinimum)!
        
        let customMaximum = upperBound.text!
        let upperBoundText = Int(customMaximum)!
        
        let customGuess = customGuesses.text!
        let GuessesText = Int(customGuess)!
        
        guessingGameViewController.minimum = lowerBoundText
        guessingGameViewController.maximum = upperBoundText
        guessingGameViewController.numberOfGuesses = GuessesText
        
    }
    
}



