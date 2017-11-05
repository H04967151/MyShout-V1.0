//
//  LoginController.swift
//  MyShout
//
//  Created by Neil on 05/11/2017.
//  Copyright © 2017 Neil. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    let loginView = LoginView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews(){
        view.backgroundColor = UIColor.Colors.darkGrey
        title = "Sign in - Sign Out"
        
        //Twitter Button
        view.addSubview(loginView.twitterLoginButton)
        loginView.twitterLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginView.twitterLoginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -74).isActive = true
        loginView.twitterLoginButton.heightAnchor.constraint(equalToConstant: 66).isActive = true
        loginView.twitterLoginButton.widthAnchor.constraint(equalToConstant: view.frame.width - 16).isActive = true
        
        //Facebook Button
        view.addSubview(loginView.facebookLoginButton)
        loginView.facebookLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginView.facebookLoginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loginView.facebookLoginButton.heightAnchor.constraint(equalToConstant: 66).isActive = true
        loginView.facebookLoginButton.widthAnchor.constraint(equalToConstant: view.frame.width - 16).isActive = true
        
        //Google Button
        view.addSubview(loginView.googleLoginButton)
        loginView.googleLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginView.googleLoginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 74).isActive = true
        loginView.googleLoginButton.heightAnchor.constraint(equalToConstant: 66).isActive = true
        loginView.googleLoginButton.widthAnchor.constraint(equalToConstant: view.frame.width - 16).isActive = true
    }

}
