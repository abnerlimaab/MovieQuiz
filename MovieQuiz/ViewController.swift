//
//  ViewController.swift
//  MovieQuiz
//
//  Created by Abner Lima on 15/04/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var viTimer: UIView!
    @IBOutlet weak var viSoundBar: UIView!
    @IBOutlet var btOptions: [UIButton]!
    @IBOutlet weak var slMusic: UISlider!
    @IBOutlet weak var ivQuiz: UIImageView!
    
    var quizManager: QuizManager!
    var quizPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        quizManager = QuizManager()
        getNewQuiz()
        startTimer()
    }
    
    func getNewQuiz() {
        let round = quizManager.generateRandomQuiz()
        
        for i in 0..<round.options.count {
            btOptions[i].setTitle(round.options[i].name, for: .normal)
        }
        
        playQuiz()
    }
    
    func startTimer() {
        viTimer.frame = view.frame
        
        UIView.animate(withDuration: 60.0, delay: 0, options: .curveLinear, animations: {
            self.viTimer.frame.size.width = 0
            self.viTimer.frame.origin.x = self.view.center.x
        }) { success in
            self.gameOver()
        }
    }
    
    func gameOver() {
        performSegue(withIdentifier: "gameOverSegue", sender: nil)
        quizPlayer.stop()
    }
    
    @IBAction func playQuiz() {
        guard let round = quizManager.round else {return}
        ivQuiz.image = UIImage(named: "movieSound")
        
        if let url = Bundle.main.url(forResource: "quote\(round.quiz.number)", withExtension: "mp3") {
            do {
                quizPlayer = try AVAudioPlayer(contentsOf: url)
                quizPlayer.volume = 1
                quizPlayer.play()
                quizPlayer.delegate = self
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    @IBAction func showHideSoundBar(_ sender: UIButton) {
        viSoundBar.isHidden = !viSoundBar.isHidden
    }
    
    @IBAction func changeMusicStatus(_ sender: UIButton) {
    }
    
    @IBAction func changeMusicTime(_ sender: UISlider) {
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        quizManager.checkAnswer(sender.title(for: .normal)!)
        getNewQuiz()
    }
    
}

extension ViewController: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        ivQuiz.image = UIImage(named: "movieSoundPause")
    }
}
