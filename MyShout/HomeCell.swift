//
//  HomeCell.swift
//  MyShout
//
//  Created by Neil on 09/08/2017.
//  Copyright © 2017 Neil. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        backgroundColor = UIColor.clear
    }
    
    let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor.Colors.lightGrey
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    let menuTitle: UILabel = {
        let label = UILabel()
        label.text = "EVENTS"
        label.font = UIFont(name: "Futura-Bold", size: 34)
        label.textColor = UIColor.white
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.borderWidth = 4
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupViews(){
        
        //Background Image
        addSubview(backgroundImage)
        backgroundImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        backgroundImage.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -16).isActive = true
        backgroundImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        //Title Label
        addSubview(menuTitle)
        menuTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        menuTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
