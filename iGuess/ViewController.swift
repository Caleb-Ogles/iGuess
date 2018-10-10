//
//  ViewController.swift
//  iGuess
//
//  Created by Caleb Ogles on 10/9/18.
//  Copyright © 2018 Caleb Ogles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: UI Outlets
    @IBOutlet weak var guessButtonOutlet: UIButton!
    @IBOutlet weak var InstructionsLabel: UILabel!
    @IBOutlet weak var userGuesstextField: UITextField!
    @IBOutlet weak var feedbackLabel: UILabel!
    @IBOutlet weak var numberOfGuessesLabel: UILabel!
    
    // MARK UI Actions
    @IBAction func GuessButton(_ sender: Any) {
        let userInput = userGuesstextField.text!
        
        guard let guess = Int(userInput) else {
            feedbackLabel.text = "You didn't give me a number! 🤔"
            return
        }
        
        guard guess >= 1 && guess <= 100 else {
            feedbackLabel.text = "Your number wasn't between 0 and 100!! 🤬"
            return
        }
        
        if guess == randomNumber {
            feedbackLabel.text = "You Win!!! 🤑"
        } else if guess < randomNumber {
            feedbackLabel.text = "Guess higher 👆"
        } else {
            feedbackLabel.text = "Guess lower 👇"
        }
    }
    
    // MARK: Properties
    var randomNumber = Int.random(in: 1...100)

    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }


}

