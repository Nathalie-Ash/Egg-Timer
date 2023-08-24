//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    
        var timer = Timer()
        var totalTime = 0
        var secondsPassed = 0

    @IBAction func hardnessSelector(_ sender: UIButton) {
        timer.invalidate() // stop and cancel the timer
             let hardness = sender.currentTitle!
             totalTime = eggTimes[hardness]!

             progressBar.progress = 0.0 // reset progress bar
             secondsPassed = 0 // reset seconds
             titleLabel.text = hardness // display the hardness selected

             timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true) //start the timer
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime) // display the progress in the progress bar
            print(Float(secondsPassed) / Float(totalTime))
        } else {
            timer.invalidate() // stop timer
            titleLabel.text = "DONE!" // print DONE on the screen
            
         
        }
    }
    
}
