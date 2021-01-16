//
//  ExtentionUIViewController.swift
//  MovieFlex
//
//  Created by mehtab alam on 16/01/2021.
//
import UIKit
extension UIViewController {
    func showActivityIndicator(messageView:MessageView) {
        // adding constraint to messageView
        view.addSubview(messageView)
        messageView.isHidden = false
        messageView.animateActivityIndicator(animate: true)
        messageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        messageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        messageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        messageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}
