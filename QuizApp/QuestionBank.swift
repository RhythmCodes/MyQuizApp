//
//  QuestionBank.swift
//  QuizApp
//
//  Created by user238804 on 3/22/24.
//

import Foundation

class QuestionBank {
    static let shared = QuestionBank()
    private init() {}
    
    var questions: [Question] = []
    
    func addQuestion(_ question: Question) {
        questions.append(question)
    }
}
