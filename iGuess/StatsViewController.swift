//
//  StatsViewController.swift
//  iGuess
//
//  Created by Caleb Ogles on 10/17/18.
//  Copyright © 2018 Caleb Ogles. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    
    @IBOutlet weak var gamesLabel: UILabel!
    @IBOutlet weak var winRateLabel: UILabel!
    @IBOutlet weak var winsLabel: UILabel!
    @IBOutlet weak var lossesLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        
        let defaults = UserDefaults.standard
        
        let wins = defaults.integer(forKey: "Wins")
        let losses = defaults.integer(forKey: "losses")
        let games = wins + losses
        
        var winRate: Int
        
        if games == 0 {
            winRate = 0
        } else {
            winRate = Int((Double(wins)) / (Double(games)) * 100.0)
        }
        
        gamesLabel.text = "\(games)"
        winsLabel.text = "\(wins)"
        lossesLabel.text = "\(losses)"
        winRateLabel.text = "\(winRate)%"
        
    }
    
}
