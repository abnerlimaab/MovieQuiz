//
//  ViewController.swift
//  MovieQuiz
//
//  Created by Abner Lima on 15/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viSoundBar: UIView!
    @IBOutlet var btOptions: [UIButton]!
    @IBOutlet weak var slMusic: UISlider!
    @IBOutlet weak var ivQuiz: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showHideSoundBar(_ sender: UIButton) {
    }
    
    @IBAction func changeMusicStatus(_ sender: UIButton) {
    }
    
    @IBAction func changeMusicTime(_ sender: UISlider) {
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
    }
    
}

