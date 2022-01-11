//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizLogic = QuizLogic()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
updateUI()
        
    }

    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle! //true or false
        let userGotItRight = quizLogic.checkAnswer(userAnswer: userAnswer)
        if userGotItRight{
            sender.backgroundColor = UIColor .green
        }else{
            sender.backgroundColor = UIColor.red
        }
        quizLogic.nextQuestion()
    Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)

    }
    @objc func updateUI(){
        questionLabel.text = quizLogic.getQuestionText()
        scoreLabel.text = "Score: \(quizLogic.getScore())"
        trueButton.backgroundColor = UIColor .clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizLogic.getProgress()
    }
    
}

