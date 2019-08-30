//
//  ViewController.swift
//  DragonBallQuiz
//
//  Created by Vivek Dosaya on 30/08/19.
//  Copyright © 2019 Vivek Dosaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    var pickedAnswer = false
    var questionNumber = 0
    var score = 0
    let allQuestions = QuestionBank()
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
}

    @IBAction func buttonPressed(_ sender: AnyObject) {
        if sender.tag == 1{
            pickedAnswer = true
            
        }
        else if sender.tag == 2{
            pickedAnswer = false
        }
        checkAnswer()
        
        
        
    }
    func checkAnswer(){
        if pickedAnswer == allQuestions.list[questionNumber].answer{
            score = score + 1
            ProgressHUD.showSuccess("Correct!")
            
            
        }
        else{
            ProgressHUD.showError("wrong!")
        }
        questionNumber += 1
        nextQuestion()
        
        
    }
    func nextQuestion(){
        
        if questionNumber <= 4{
            display()
            questionLabel.text = allQuestions.list[questionNumber].questionText
            
            
        }
        else{
            let alert = UIAlertController(title: "Awesome!", message: "Do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(restartAction)
            present(alert,animated: true, completion: nil)
            
            
            
        }
    }
    func startOver(){
        questionNumber = 0
        score = 0
        updateUI()
}
    func updateUI(){
        
        display()
        
        nextQuestion()
    }
    func display(){
        progressBar.frame.size.width = (view.frame.size.width / 5) * CGFloat(questionNumber+1)
        questionNumberLabel.text = "\(questionNumber + 1)/5"
        scoreLabel.text = "Score : \(score)"
        
    }
    
    
}

