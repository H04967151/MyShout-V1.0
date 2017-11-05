//
//  EventsFeedCell.swift
//  MyShout
//
//  Created by Neil on 05/08/2017.
//  Copyright © 2017 Neil. All rights reserved.
//

import UIKit


protocol EventCellDelegate {
    
    func userDidTappCell(eventImage: UIImage, eventTitle: String, eventBlurb: String, eventDate: String, eventLocation: String)
    
}


class EventsFeedCell: UICollectionViewCell {
    
    var delegate: EventCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let eventImage : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.Colors.lightGrey
        imageView.image = #imageLiteral(resourceName: "slug")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        
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
        label.font = UIFont(name: "Arial", size: 12)
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
        label.font = UIFont(name: "Futura-Bold", size: 10)
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
        label.font = UIFont(name: "Futura-Bold", size: 10)
        label.textColor = UIColor.Colors.darkGrey
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupViews(){
        backgroundColor = UIColor.white
        
        
        //EventImage
        addSubview(eventImage)
        eventImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        eventImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        eventImage.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        //Event Titial
        addSubview(eventTitle)
        eventTitle.topAnchor.constraint(equalTo: eventImage.bottomAnchor, constant: 8).isActive = true
        eventTitle.leftAnchor.constraint(equalTo: eventImage.leftAnchor, constant: 8).isActive = true
        
        //Event Blurb
        addSubview(eventBlurb)
        eventBlurb.topAnchor.constraint(equalTo: eventTitle.bottomAnchor, constant: 8).isActive = true
        eventBlurb.leftAnchor.constraint(equalTo: eventImage.leftAnchor, constant: 8).isActive = true
        eventBlurb.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -56).isActive = true
        
        //Calendar Icon
        addSubview(calIcon)
        calIcon.topAnchor.constraint(equalTo: eventBlurb.bottomAnchor, constant: 16).isActive = true
        calIcon.leftAnchor.constraint(equalTo: eventBlurb.leftAnchor).isActive = true
        calIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        calIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        //Time Label
        addSubview(eventTime)
        eventTime.centerYAnchor.constraint(equalTo: calIcon.centerYAnchor).isActive = true
        eventTime.leftAnchor.constraint(equalTo: calIcon.rightAnchor, constant: 8).isActive = true
        eventTime.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -56).isActive = true
        
        //Location Icon
        addSubview(locationIcon)
        locationIcon.topAnchor.constraint(equalTo: calIcon.bottomAnchor, constant: 8).isActive = true
        locationIcon.leftAnchor.constraint(equalTo: eventBlurb.leftAnchor, constant: -1).isActive = true
        locationIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        locationIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        //Location Label
        addSubview(eventLocation)
        eventLocation.centerYAnchor.constraint(equalTo: locationIcon.centerYAnchor).isActive = true
        eventLocation.leftAnchor.constraint(equalTo: locationIcon.rightAnchor, constant: 8).isActive = true
        eventLocation.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -56).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
