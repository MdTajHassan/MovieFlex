//
//  ActivityIndicatorView.swift
//  MovieFlex
//
//  Created by mehtab alam on 16/01/2021.
//

import UIKit

class MessageView: UIView {
   
    private var showCancelButton: Bool = false
    public var addBlurBackground: Bool = false

    private let lblMessage: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(white: 1.0, alpha: 0.5)
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.translatesAutoresizingMaskIntoConstraints = false
        aiv.hidesWhenStopped = true
        return aiv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    init(showCancelButton: Bool = false, addBlurBackground: Bool = false) {
        super.init(frame: CGRect.zero)
        self.showCancelButton = showCancelButton
        self.addBlurBackground = addBlurBackground
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    private func setupView() {
        
        backgroundColor = UIColor.clear
        clipsToBounds = true
        
        if addBlurBackground {
            addBlur()
        }
        
        addSubview(lblMessage)
        lblMessage.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        lblMessage.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        lblMessage.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        lblMessage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        
        // activityIndicator
        addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        activityIndicator.stopAnimating()
    }
    
    public func addBlur() {
        if !UIAccessibility.isReduceTransparencyEnabled {
            backgroundColor = UIColor.clear
            let blurEffect = UIBlurEffect(style: .systemChromeMaterial)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = bounds
            blurEffectView.alpha = 0.9
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            addSubview(blurEffectView)
        } else {
            let blurEffect = UIBlurEffect(style: .systemChromeMaterial)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            addSubview(blurEffectView)
        }
    }
    
    public func showMessage(message: String) {
        DispatchQueue.main.async {
            self.lblMessage.text = message.uppercased()
        }
    }
    
    public func animateActivityIndicator(animate: Bool) {
        if animate {
            if activityIndicator.isHidden {
                activityIndicator.isHidden = false
            }
            
            showMessage(message: "")
            
            activityIndicator.startAnimating()
        } else {
            
            activityIndicator.stopAnimating()
        }
    }
}

