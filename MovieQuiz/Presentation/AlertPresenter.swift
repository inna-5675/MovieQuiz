//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by MacBook Pro on 24.1.25..
//

import UIKit

class AlertPresenter {
    weak var delegate: AlertPresenterlDelegate?
    
    func showResult (result:AlertModel) {
        
        let alertResult = UIAlertController(
            title: result.title,
            message: result.message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: result.buttonText, style: .default) {_ in  result.completion()}
        
        alertResult.addAction(action)
        
        delegate?.didReceiveResultView(alertResult: alertResult, alertAction: action)
    }
}

