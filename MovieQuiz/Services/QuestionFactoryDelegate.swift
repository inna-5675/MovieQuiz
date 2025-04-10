//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by MacBook Pro on 21.1.25..
//

import Foundation

protocol QuestionFactoryDelegate {
    func didReceiveNextQuestion(question: QuizQuestion?)
    func didLoadDataFromServer()
    func didFailToLoadData(with error: Error) 
}
