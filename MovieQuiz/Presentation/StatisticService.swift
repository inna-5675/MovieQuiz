//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by MacBook Pro on 27.1.25..
//

import UIKit


final class StatisticService: StatisticServiceProtocol {
    
    private let storage: UserDefaults = .standard
 
    private enum Keys: String {
        case gamesCount
        case totalAccuracy
        case correct
        case total
        case date
    }
    
    var totalAccuracy: Double {
        get {
            storage.double(forKey: Keys.totalAccuracy.rawValue)
        }
        set {
            storage.set(newValue, forKey: Keys.totalAccuracy.rawValue)
        }
    }
    
    var gamesCount: Int {
        get {
            storage.integer(forKey: Keys.gamesCount.rawValue)
        }
        set {
            storage.set(newValue, forKey: Keys.gamesCount.rawValue)
        }
    }
    
   
    var bestGame: GameResult {
        get {
            let correctAnswers: Int = storage.integer(forKey: Keys.correct.rawValue)
            let totalQuestionsInBestGame:Int = storage.integer(forKey: Keys.total.rawValue)
            let bestGameDate = storage.object(forKey: Keys.date.rawValue) as? Date ?? Date()
            
            return GameResult(correct: correctAnswers, total: totalQuestionsInBestGame, date: bestGameDate)
        }
        set {
            storage.set(newValue.correct, forKey: Keys.correct.rawValue)
            storage.set(newValue.total, forKey: Keys.total.rawValue)
            storage.set(newValue.date, forKey: Keys.date.rawValue)
        }
    }
    func store(correct count: Int, total amount: Int) -> String {
        gamesCount += 1
        
        let savedCorrectAnswersSum:Double = self.totalAccuracy*Double(gamesCount - 1)*10
        let newCorrectAnswersSum:Double = savedCorrectAnswersSum + Double(count)
        let newTotalAccuracy:Double = (newCorrectAnswersSum/(Double(gamesCount)*10))
        totalAccuracy = newTotalAccuracy
        
        let currentGameResult:GameResult = GameResult(correct: count, total: amount, date: Date.now)
        if currentGameResult.isBetterThan(self.bestGame) {
            storage.set(currentGameResult.correct, forKey: Keys.correct.rawValue)
            storage.set(currentGameResult.total, forKey: Keys.total.rawValue)
            storage.set(currentGameResult.date, forKey: Keys.date.rawValue)
        }
        
        let resultText: String = "Ваш результат: \(currentGameResult.correct)/\(currentGameResult.total)"
        let countGameText: String = "Количество сыгранных квизов: \(gamesCount)"
        let bestScoreText: String = "Рекорд: \(self.bestGame.correct)/\(self.bestGame.total) (\(self.bestGame.date.dateTimeString))"
        let middleScoreText: String = String(format: "Средняя точность: %.2f", totalAccuracy*100) + "%"
        
        return "\(resultText)\n\(countGameText)\n\(bestScoreText)\n\(middleScoreText)"
    }
}


