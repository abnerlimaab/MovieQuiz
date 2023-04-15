//
//  QuizManager.swift
//  MovieQuiz
//
//  Created by Abner Lima on 15/04/23.
//

import Foundation

typealias Round = (quiz: Quiz, options: [QuizOption])

struct Quiz: Codable {
    let name: String
    let number: Int
}

struct QuizOption: Codable {
    let name: String
}

class QuizManager {
    
    var quizes: [Quiz]
    let quizOptions: [QuizOption]
    var round: Round!
    var score: Int
    
    init() {
        score = 0
        let quizesUrl = Bundle.main.url(forResource: "quizes", withExtension: "json")!
        let quizOptionsUrl = Bundle.main.url(forResource: "options", withExtension: "json")!
        
        do {
            let quizData = try Data(contentsOf: quizesUrl)
            quizes = try JSONDecoder().decode([Quiz].self, from: quizData)
            
            let quizOptionsData = try Data(contentsOf: quizOptionsUrl)
            quizOptions = try JSONDecoder().decode([QuizOption].self, from: quizOptionsData)
        } catch {
            print(error.localizedDescription)
            quizes = []
            quizOptions = []
        }
    }
    
    private func generateRandomIndex() -> Int {
        return Int(arc4random_uniform(UInt32(quizes.count)))
    }
    
    func generateRandomQuiz() -> Round {
        let quizIndex = generateRandomIndex()
        let quiz = quizes[quizIndex]
        var indexes: Set<Int> = [quizIndex]
        
        while indexes.count < 4 {
            let index = generateRandomIndex()
            indexes.insert(index)
        }
        
        let options = indexes.map({quizOptions[$0]})
        
        let newRound: Round = (quiz, options)
        round = newRound
        return round
    }
    
    func checkAnswer(_ answer: String) {
        guard let round = round else {return}
        
        if answer == round.quiz.name {
                score += 1
        }
    }
    
}
