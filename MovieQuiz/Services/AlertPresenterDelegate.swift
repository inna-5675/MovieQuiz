//
//  AlertProtocolDelegate.swift
//  MovieQuiz
//
//  Created by MacBook Pro on 24.1.25..
//

import UIKit

protocol AlertPresenterlDelegate: AnyObject {
    func didReceiveResultView (alertResult: UIAlertController, alertAction: UIAlertAction)
}
