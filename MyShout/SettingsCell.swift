//
//  SettingsCellCollectionViewCell.swift
//  MyShout
//
//  Created by Neil on 08/08/2017.
//  Copyright © 2017 Neil. All rights reserved.
//

import UIKit


class SettingsCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        backgroundColor = UIColor.white
    }
    
    let settingOneLabel: UILabel = {
        let label = UILabel()
        label.text = "Settin One Label"
        label.font = UIFont(name: "Futura", size: 16)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let settingsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "settings")
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    func setupViews(){
        addSubview(settingsImageView)
        addSubview(settingOneLabel)
        
        //Settings Icon
        settingsImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        settingsImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        settingsImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        settingsImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        //Settings Name
        settingOneLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        settingOneLabel.leftAnchor.constraint(equalTo: settingsImageView.rightAnchor, constant: 16).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
