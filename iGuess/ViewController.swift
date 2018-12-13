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
    var minimum = 1
    var maximum = 100
    var numberOfGuesses = 5
    
    var randomNumber = Int.random(in: 1...100)
    var guessesRemaining = 5
    

    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        restart()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    // MARK: Functions
    
    func restart() {
        // new random number
        randomNumber = Int.random(in: minimum...maximum)
        // reset guesses remaining
        guessesRemaining = numberOfGuesses
        // clear text field
        userGuesstextField.text = ""
        // enable text field
        userGuesstextField.isEnabled = true
        // hide play again button
        PlayAgain.isHidden = true
        // show guess button
        guessButtonOutlet.isHidden = false
        // reset feedback label
        feedbackLabel.text = "Guess a number! 🤯"
        // reset guesses remaining label
        numberOfGuessesLabel.text = "You have \(guessesRemaining) guesses left 🤭"
        // Set instruction label
        InstructionsLabel.text = "Please enter a number between \(minimum) and \(maximum)"
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
        guard guess >= minimum && guess <= maximum else {
            feedbackLabel.text = "Your number wasn't between \(minimum) and \(maximum)!! 🤬"
            return
        }
        
        guard guessesRemaining > 1 else {
            lose()
            return
        }
        
        if guess == randomNumber {
            win()
            return
            
        } else if guess < randomNumber {
            feedbackLabel.text = "Guess higher 👆"
            
        } else {
            feedbackLabel.text = "Guess lower 👇"
        }
        
        guessesRemaining -= 1
        numberOfGuessesLabel.text = "You have \(guessesRemaining) guesses left 🤭"
    }
    
    func win() {
        
        let defaults = UserDefaults.standard
        let wins = defaults.integer(forKey: "Wins")
        defaults.set(wins + 1, forKey: "Wins")
        
        feedbackLabel.text = "You Win!!! 🤑"
        setUpUIForRestart()
        return
    }
    
    func lose() {
        
        let defaults = UserDefaults.standard
        let losses = defaults.integer(forKey: "Losses")
        defaults.set(losses + 1, forKey: "Losses")
        
        feedbackLabel.text = "You lose!! 🤕"
        setUpUIForRestart()
        return
    }
    
}



