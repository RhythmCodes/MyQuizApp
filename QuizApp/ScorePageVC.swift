//
//  ScorePageViewController.swift
//  QuizApp
//
//  Created by user238804 on 3/22/24.
//

import UIKit

class ScorePageVC: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    var score: String?  
        
        override func viewDidLoad() {
            super.viewDidLoad()
            if let score = score {
                scoreLabel.text = "You scored: \(score)"
            }
        }
    }
