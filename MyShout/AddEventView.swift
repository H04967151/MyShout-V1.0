//
//  AddEventView.swift
//  MyShout
//
//  Created by Neil on 09/08/2017.
//  Copyright © 2017 Neil. All rights reserved.
//

import UIKit

class AddEventView: UIView {
    
    let addImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.Colors.darkGrey
        imageView.image = #imageLiteral(resourceName: "placeholder-image")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    let eventTitleTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.white
        textField.font = UIFont(name: "Futura-Bold", size: 20)
        textField.attributedPlaceholder = NSAttributedString(string:"Event Name", attributes:[NSAttributedStringKey.foregroundColor: UIColor.Colors.lightGrey])
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let descriptionPlaceholderText: UILabel = {
       let label = UILabel()
        label.text = "Description..."
        label.font = UIFont(name: "Futura", size: 20)
        label.textColor = UIColor.Colors.lightGrey
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.white
        textView.font = UIFont(name: "Futura", size: 20)
        textView.layer.sublayerTransform = CATransform3DMakeTranslation(2, 0, 0)
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let calIcon : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "cal")
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    let dateTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.white
        textField.attributedPlaceholder = NSAttributedString(string:"Date", attributes:[NSAttributedStringKey.foregroundColor: UIColor.Colors.lightGrey])
        textField.font = UIFont(name: "Futura-bold", size: 20)
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0)
        
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    let datePicker: UIDatePicker = {
        let dp = UIDatePicker()
        
        dp.translatesAutoresizingMaskIntoConstraints = false
        return dp
    }()
    
    let locationIcon : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "location")
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let locationNameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.white
        textField.font = UIFont(name: "Futura-bold", size: 20)
        textField.attributedPlaceholder = NSAttributedString(string:"Location", attributes:[NSAttributedStringKey.foregroundColor: UIColor.Colors.lightGrey])
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0)
        textField.addTarget(self, action: #selector(AddEventController.getUsersLocation), for: .allTouchEvents)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let locationAddressTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.white
        textView.font = UIFont(name: "Futura", size: 16)
        textView.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0)
        textView.isEditable = false
        textView.isUserInteractionEnabled = false
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let saveEventButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        button.setTitle("+ SAVE EVENT", for: .normal)
        button.isEnabled = true
        button.setTitleColor(UIColor(red:0.22, green:0.21, blue:0.23, alpha:1.00), for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Bold", size: 20)
        button.layer.borderColor = UIColor(red:0.22, green:0.21, blue:0.23, alpha:1.00).cgColor
        button.layer.borderWidth = 8
        
        button.addTarget(self, action: #selector (AddEventController.userDidTapSaveButton), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    



}
