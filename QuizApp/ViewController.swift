//
//  ViewController.swift
//  QuizApp
//
//  Created by user238804 on 3/22/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        titleLabel.text = "My Quiz App"
    }

    
    @IBAction func buildQuestionBankTapped(_ sender: UIButton) {
      
    }
    
    @IBAction func startQuizTapped(_ sender: Any) {
        if QuestionBank.shared.questions.isEmpty {
                   showAlert(message: "Not enough questions. Please add questions to the question bank.")
               } else {
                 
               }
        
    }
    
    func showAlert(message: String) {
            let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
    }
    


