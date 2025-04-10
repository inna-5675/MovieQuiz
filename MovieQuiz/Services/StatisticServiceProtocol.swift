//
//  StatisticServiceProtocol.swift
//  MovieQuiz
//
//  Created by MacBook Pro on 27.1.25..
//

import UIKit

protocol StatisticServiceProtocol {
    var totalAccuracy: Double { get }
    var gamesCount: Int { get }
    var bestGame: GameResult { get }

    func store(correct count: Int, total amount: Int) -> String
}
