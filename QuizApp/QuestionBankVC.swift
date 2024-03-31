//
//  QuestionBankViewController.swift
//  QuizApp
//
//  Created by user238804 on 3/22/24.
//

import UIKit

class QuestionBankVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self        // Do any additional setup after loading the view.
    }
    
    @IBAction func addQuestionButtonTapped(_ sender: UIButton) {
      
    }
    

}

extension QuestionBankVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return QuestionBank.shared.questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)
        let question = QuestionBank.shared.questions[indexPath.row]
        cell.textLabel?.text = question.question
        return cell
    }
}
