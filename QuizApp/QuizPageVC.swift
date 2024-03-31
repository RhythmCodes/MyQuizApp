//
//  QuizPageViewController.swift
//  QuizApp
//
//  Created by user238804 on 3/22/24.
//

import UIKit

class QuizPageVC: UIViewController {

    @IBOutlet weak var questionText: UILabel!
    
    
    @IBOutlet weak var choice1: UIButton!
    
    
    @IBOutlet weak var choice2: UIButton!
    
    
    @IBOutlet weak var choice3: UIButton!
    
    @IBOutlet weak var choice4: UIButton!
    
    
    @IBOutlet weak var progressView: UIProgressView!
    
    var currentQuestionIndex = 0
    var userAnswers: [String?] = []
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userAnswers = Array(repeating: nil, count: QuestionBank.shared.questions.count)
                showQuestion(at: currentQuestionIndex)
        // Do any additional setup after loading the view.
    }
    
    func showQuestion(at index: Int) {
           let question = QuestionBank.shared.questions[index]
           questionText.text = question.question
           let allAnswers = [question.correctChoice] + question.incorrectChoices
           let shuffledAnswers = allAnswers.shuffled()
           choice1.setTitle(shuffledAnswers[0], for: .normal)
           choice2.setTitle(shuffledAnswers[1], for: .normal)
           choice3.setTitle(shuffledAnswers[2], for: .normal)
           choice4.setTitle(shuffledAnswers[3], for: .normal)
           
           let progress = Float(index + 1) / Float(QuestionBank.shared.questions.count)
           progressView.setProgress(progress, animated: true)
       }
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        if currentQuestionIndex > 0 {
                    currentQuestionIndex -= 1
                    showQuestion(at: currentQuestionIndex)
                }
    }
    
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if currentQuestionIndex < QuestionBank.shared.questions.count - 1 {
                    currentQuestionIndex += 1
                    showQuestion(at: currentQuestionIndex)
                } else {
                    // Navigate to score page
                    performSegue(withIdentifier: "forwardToScore", sender: self)
                }
        
    }
    
    
    @IBAction func radioButtonTapped(_ sender: UIButton) {
        userAnswers[currentQuestionIndex] = sender.titleLabel?.text

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "forwardToScore" {
            if let scorePageVC = segue.destination as? ScorePageVC {
                let score = calculateScore()
                scorePageVC.score = score  
            }
        }
    }
    func calculateScore() -> String {
            var correctAnswers = 0
            for (index, question) in QuestionBank.shared.questions.enumerated() {
                if userAnswers[index] == question.correctChoice {
                    correctAnswers += 1
                }
            }
            let totalQuestions = QuestionBank.shared.questions.count
            return "\(correctAnswers)/\(totalQuestions)"
        }
    
}
