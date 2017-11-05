//
//  LoginView.swift
//  MyShout
//
//  Created by Neil on 05/11/2017.
//  Copyright © 2017 Neil. All rights reserved.
//

import UIKit

class LoginView {
    
    let twitterLoginButton : UIButton = {
        let button = UIButton()
        button.setTitle("Twitter", for: .normal)
        button.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Bold", size: 20)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let facebookLoginButton : UIButton = {
        let button = UIButton()
        button.setTitle("Facebook", for: .normal)
        button.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Bold", size: 20)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let googleLoginButton : UIButton = {
        let button = UIButton()
        button.setTitle("Google", for: .normal)
        button.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Bold", size: 20)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
}
