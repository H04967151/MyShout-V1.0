//
//  AddEventView.swift
//  MyShout
//
//  Created by Neil on 08/08/2017.
//  Copyright © 2017 Neil. All rights reserved.
//

import UIKit

class DetailEventView: UIView {
    
    
    let eventImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor.white
        //imageView.image = #imageLiteral(resourceName: "slug")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let eventTitle: UILabel = {
        let label = UILabel()
        label.text = "Jasons Birthday Bash"
        label.font = UIFont(name: "Futura-Bold", size: 20)
        label.textColor = UIColor.Colors.darkGrey
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let eventBlurb: UILabel = {
        let label = UILabel()
        label.text = "Come and join jason at the Slug and Lettuce to celebrate his birthday first drink is on Jason."
        label.font = UIFont(name: "Arial", size: 14)
        label.textColor = UIColor.Colors.lightGrey
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let calIcon : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "cal")
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let eventTime: UILabel = {
        let label = UILabel()
        label.text = "Friday 11th August - 17:00"
        label.font = UIFont(name: "Futura-Bold", size: 12)
        label.textColor = UIColor.Colors.darkGrey
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let locationIcon : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "location")
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let eventLocation: UILabel = {
        let label = UILabel()
        label.text = "Slug & Lettuce Canary Wharf"
        label.font = UIFont(name: "Futura-Bold", size: 12)
        label.textColor = UIColor.Colors.darkGrey
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let eventAcceptButton: UIButton = {
        let button = UIButton()
        button.setTitle("GOING", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Bold", size: 14)
        button.backgroundColor = UIColor.Colors.darkGrey
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let eventMaybeButton: UIButton = {
        let button = UIButton()
        button.setTitle("MAYBE", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Bold", size: 14)
        button.backgroundColor = UIColor.Colors.lightGrey
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()



}





















