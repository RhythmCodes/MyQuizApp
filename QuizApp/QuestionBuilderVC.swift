//
//  QuestionBuilderViewController.swift
//  QuizApp
//
//  Created by user238804 on 3/22/24.
//

import UIKit

class QuestionBuilderVC: UIViewController {

    @IBOutlet weak var questionText: UITextField!
    
    @IBOutlet weak var correctChoice: UITextField!
    
    @IBOutlet weak var incorrectChoice1: UITextField!
    
    
    @IBOutlet weak var incorrectChoice2: UITextField!
    
    
    @IBOutlet weak var incorrectChoice3: UITextField!
    
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        
        let question = Question(question: questionText.text ?? "",
                                        correctChoice: correctChoice.text ?? "",
                                        incorrectChoices: [incorrectChoice1.text ?? "",
                                                           incorrectChoice2.text ?? "",
                                                           incorrectChoice3.text ?? ""])
                QuestionBank.shared.addQuestion(question)
                dismiss(animated: true, completion: nil)
            }

            
          
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   

}
