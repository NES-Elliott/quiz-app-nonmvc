//
//  ViewController.swift
//  Quiz-App
//
//  Created by Nathaniel Spry on 11/18/21.
//

import UIKit

class ViewController: UIViewController {

// Outlets -> Variables | Actions -> Functions
    
    @IBOutlet weak var questionsLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    // 2D Array
    var questionBank = [
        ["5 + 2 = 9", "False"],
        ["7 - 4 = 3", "True"],
        ["3 + 3 = 6", "True"],
        ["8 - 4 = 5", "False"],
        ["4 + 0 = 4", "True"],
    ]
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        updateUI() // Calling a function
    
    }
    
    @objc func updateUI() { //Create updateUI function
        
        questionsLabel.text = questionBank[questionNumber][0]
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let userInput = sender.currentTitle!
        
        if userInput == questionBank[questionNumber][1] {
            
            sender.backgroundColor = UIColor.green
            
        } else {
            
            sender.backgroundColor = UIColor.red
            
        }
        
        if questionNumber + 1 < questionBank.count {
            
            questionNumber += 1
            
        } else {
            
            questionNumber = 0
            
        }
        
        Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(updateUI), userInfo: nil, repeats: true)
        
    }
    
}
