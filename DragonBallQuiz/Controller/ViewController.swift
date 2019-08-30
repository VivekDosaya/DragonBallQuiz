//
//  ViewController.swift
//  DragonBallQuiz
//
//  Created by Vivek Dosaya on 30/08/19.
//  Copyright © 2019 Vivek Dosaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionNumberLabel: UILabel!
    var pickedAnswer = false
    var questionNumber = 0
    
    @IBOutlet weak var scoreLabel: UILabel!
    let allQuestions = QuestionBank()
    
    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = allQuestions.list[questionNumber].questionText
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
            print("correct")
        }
        else{
            print("wrong")
        }
        questionNumber += 1
        nextQuestion()
        
        
    }
    func nextQuestion(){
        print("\(questionNumber)")
        
        if questionNumber <= 4{
            print(true)
            questionLabel.text = allQuestions.list[questionNumber].questionText
            print(true)
            
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
        updateUI()
}
    func updateUI(){
        nextQuestion()
    }
    
}

