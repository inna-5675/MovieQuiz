//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by MacBook Pro on 24.1.25..
//

import UIKit

struct AlertModel {
    var title: String
    var message: String
    var buttonText: String
    var completion: () -> Void
    
    init(title: String, message: String, buttonText: String, completion: @escaping () -> Void) {
        self.title = title
        self.message = message
        self.buttonText = buttonText
        self.completion = completion
    }
}

