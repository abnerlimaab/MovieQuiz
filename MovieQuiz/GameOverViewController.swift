//
//  GameOverViewController.swift
//  MovieQuiz
//
//  Created by Abner Lima on 15/04/23.
//

import UIKit

class GameOverViewController: UIViewController {

    @IBOutlet weak var lbScore: UILabel!
    
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lbScore.text = "\(score)"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
