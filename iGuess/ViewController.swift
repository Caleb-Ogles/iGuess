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
    @IBOutlet weak var PlayAgain: UIButton!
    
    // MARK UI Actions
    @IBAction func PlayAgainTapped(_ sender: Any) {
        restart()
    }
    
    @IBAction func GuessButton(_ sender: Any) {
        let userInput = userGuesstextField.text!
        
        guard let guess = Int(userInput) else {
            feedbackLabel.text = "You didn't give me a number! 🤔"
            return
        }
        
        makeAGuess(guess)
    }
    
    // MARK: Properties
    var randomNumber = Int.random(in: 1...100)
    var guessesRemaining = 5
    

    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    // MARK: Functions
    
    func restart(){
        // new random number
        randomNumber = Int.random(in: 1...100)
        // reset guesses remaining
        guessesRemaining = 5
        // clear text field
        userGuesstextField.text = ""
        // enable text field
        userGuesstextField.isEnabled = true
        // hide play again button
        PlayAgain.isHidden = true
        // show guess button
        guessButtonOutlet.isHidden = false
        // reset feedback label
        feedbackLabel.text = "Too High/Low"
        // reset guesses remaining label
        numberOfGuessesLabel.text = "You have \(guessesRemaining) guesses left"
    }
    
    
    
    func setUpUIForRestart() {
        
        //disable input
        userGuesstextField.isEnabled = false
        
        //hide guess button
        guessButtonOutlet.isHidden = true
        
        //Unhide play again button
        PlayAgain.isHidden = false
    
    }

    
    func makeAGuess(_ guess: Int) {
        guard guess >= 1 && guess <= 100 else {
            feedbackLabel.text = "Your number wasn't between 0 and 100!! 🤬"
            return
        }
        
        guard guessesRemaining > 0 else {
            feedbackLabel.text = "You lose!! 🤕"
            setUpUIForRestart()
            return
        }
        
        if guess == randomNumber {
            feedbackLabel.text = "You Win!!! 🤑"
            setUpUIForRestart()
            return
            
        } else if guess < randomNumber {
            feedbackLabel.text = "Guess higher 👆"
            
        } else {
            feedbackLabel.text = "Guess lower 👇"
        }
        
        guessesRemaining -= 1
        numberOfGuessesLabel.text = "You have \(guessesRemaining) guesses left 🤠"
    }
    
}



