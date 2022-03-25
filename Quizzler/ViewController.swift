//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    let allQuestions = QuestionBank()
    var questionNumber: Int = 0
    var pikcedAnswer: Bool = false
    var score:Int = 0
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1{
             pikcedAnswer = true
          

        }
        else if sender.tag == 2{
            pikcedAnswer = false
        }
        
        checkAnswer()
        questionNumber += 1
        nextQuestion()
    }
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber+1) / 13"
        progressBar.frame.size.width = (view.frame.size.width / 13)*CGFloat(questionNumber+1)
      
    }

    func nextQuestion() {
        if questionNumber <= 12{
        questionLabel.text = allQuestions.list[questionNumber].questionText
        updateUI()
            
        }
        else{
            let alert = UIAlertController(title: "Great Work", message: "You have finished all the question, wanna play again ?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default) { UIAlertAction in
                self.startOver()
            }
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            print("End of Quiz")
            questionNumber = 0
        }
    }
    
    
    func checkAnswer() {
        
        if pikcedAnswer == allQuestions.list[questionNumber].answer{
            score += 100
            
        }
        else{
            
        }
    }
    
    
    func startOver() {
        questionLabel.text = allQuestions.list[questionNumber].questionText
        score = 0
        updateUI()
        
       
    }
    

    
}
