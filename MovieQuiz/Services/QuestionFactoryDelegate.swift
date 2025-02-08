//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by MacBook Pro on 21.1.25..
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)
}

