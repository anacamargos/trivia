//
//  GameViewController.swift
//  Trivia
//
//  Created by Ana Leticia Camargos on 06/04/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var questionImageView: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    
    var game: QMeGame = QMeGame()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pointLabel.text = "--"
        let starterImage = UIImage(named: "2")
        questionImageView.image = starterImage
        questionLabel.text = "Tap the true button to start a game!"
        falseButton.isEnabled = false
    }
    
    @IBAction func trueButtonDidTap () {
        if pointLabel.text == "--" {
            //new game
            game.point = 0
            falseButton.isEnabled = true
        } else {
            game.point += 1
        }
        updateUI()
    }
    
    @IBAction func falseButtonDidTap() {
        game.point -= 1
        updateUI()
    }
    
    func updateUI() {
        let nextQuestion = game.getNextQuestion()
        let questionImage = game.getQuestionImageName()
        let image = UIImage(named: questionImage)
        
        questionImageView.image = image
        questionLabel.text = nextQuestion
        pointLabel.text = "\(game.point)"
    }
}
