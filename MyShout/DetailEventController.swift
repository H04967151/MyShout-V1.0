//
//  AddEventController.swift
//  MyShout
//
//  Created by Neil on 08/08/2017.
//  Copyright © 2017 Neil. All rights reserved.
//

import UIKit

class DetailEventController: UIViewController{
    
    let detailEventView = DetailEventView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        let image = #imageLiteral(resourceName: "events")
        let imageView = UIImageView(image: image)
        
        let bannerWidth = navigationController?.navigationBar.frame.size.width
        let bannerHeight = navigationController?.navigationBar.frame.size.height
        
        let bannerX = bannerWidth! / 2 - image.size.width / 2
        let bannnerY = bannerHeight! / 2 - image.size.height / 2
        imageView.frame = CGRect(x: bannerX, y: bannnerY, width: bannerWidth! / 2, height: bannerHeight! / 2)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
        
        setupViews()
    }

    
    func setupViews(){

        //Main Image View
        view.addSubview(detailEventView.eventImageView)
        detailEventView.eventImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        detailEventView.eventImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        detailEventView.eventImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        detailEventView.eventImageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        //Event Titile
        view.addSubview(detailEventView.eventTitle)
        detailEventView.eventTitle.topAnchor.constraint(equalTo: detailEventView.eventImageView.bottomAnchor, constant: 8).isActive = true
        detailEventView.eventTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        detailEventView.eventTitle.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32).isActive = true
        
        //Event Desc
        view.addSubview(detailEventView.eventBlurb)
        detailEventView.eventBlurb.topAnchor.constraint(equalTo: detailEventView.eventTitle.bottomAnchor, constant: 8).isActive = true
        detailEventView.eventBlurb.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        detailEventView.eventBlurb.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32).isActive = true
        
        //Calendar Icon
        view.addSubview(detailEventView.calIcon)
        detailEventView.calIcon.topAnchor.constraint(equalTo: detailEventView.eventBlurb.bottomAnchor, constant: 16).isActive = true
        detailEventView.calIcon.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        detailEventView.calIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        detailEventView.calIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        //Time Label
        view.addSubview(detailEventView.eventTime)
        detailEventView.eventTime.centerYAnchor.constraint(equalTo: detailEventView.calIcon.centerYAnchor).isActive = true
        detailEventView.eventTime.leftAnchor.constraint(equalTo: detailEventView.calIcon.rightAnchor, constant: 16).isActive = true
        
        //Location Icon
        view.addSubview(detailEventView.locationIcon)
        detailEventView.locationIcon.topAnchor.constraint(equalTo: detailEventView.calIcon.bottomAnchor, constant: 16).isActive = true
        detailEventView.locationIcon.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 14).isActive = true
        detailEventView.locationIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        detailEventView.locationIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        //Location Label
        view.addSubview(detailEventView.eventLocation)
        detailEventView.eventLocation.centerYAnchor.constraint(equalTo: detailEventView.locationIcon.centerYAnchor).isActive = true
        detailEventView.eventLocation.leftAnchor.constraint(equalTo: detailEventView.locationIcon.rightAnchor, constant: 16).isActive = true
        
        //Accept Button
        view.addSubview(detailEventView.eventAcceptButton)
        detailEventView.eventAcceptButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
        detailEventView.eventAcceptButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        detailEventView.eventAcceptButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        detailEventView.eventAcceptButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -16).isActive = true
        
        //Maybe Button
        view.addSubview(detailEventView.eventMaybeButton)
        detailEventView.eventMaybeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
        detailEventView.eventMaybeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        detailEventView.eventMaybeButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        detailEventView.eventMaybeButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -16).isActive = true
        
        
        
        
        
    }
    
    
    


}
