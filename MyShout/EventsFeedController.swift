//
//  ViewController.swift
//  MyShout
//
//  Created by Neil on 05/08/2017.
//  Copyright © 2017 Neil. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cellID2"

class EventsFeedController: UICollectionViewController, UICollectionViewDelegateFlowLayout, EventCellDelegate {
    
    let networkCall = NetworkCalls()
    let detailEventController = DetailEventController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupNavBarItems()
        networkCall.callNetwork()
    
        collectionView?.delegate = self
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return networkCall.events.count
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? EventsFeedCell
        
        let event = networkCall.events[indexPath.row]
        
        cell?.eventTitle.text = event.name
        cell?.eventBlurb.text = event.descriptionText
        cell?.eventTime.text = event.date
        cell?.eventLocation.text = event.location
        cell?.eventImage.image = event.imageURL
        
        cell?.delegate = self
        
        return cell!
    }
    
    
    
    func userDidTappCell(eventImage: UIImage, eventTitle: String, eventBlurb: String, eventDate: String, eventLocation: String) {
        detailEventController.detailEventView.eventImageView.image = eventImage
        detailEventController.detailEventView.eventTitle.text = eventTitle
        detailEventController.detailEventView.eventBlurb.text = eventBlurb
        detailEventController.detailEventView.eventTime.text = eventDate
        detailEventController.detailEventView.eventLocation.text = eventLocation
    }
    
    func userDidTappSetting(name: String) {
        print("delegate did fire")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 16, height: 348)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let selectedCell = collectionView.cellForItem(at: indexPath)! as! EventsFeedCell
        
        userDidTappCell(eventImage: selectedCell.eventImage.image!, eventTitle: selectedCell.eventTitle.text!, eventBlurb: selectedCell.eventBlurb.text!, eventDate: selectedCell.eventTime.text!, eventLocation: selectedCell.eventLocation.text!)
        show(detailEventController, sender: self)
        
    }
    
    
    @objc func handleDismissView(){
        dismiss(animated: true, completion: nil)
    }
    
    func setupNavBarItems(){
        
        //Brand
        let image = #imageLiteral(resourceName: "events")
        let imageView = UIImageView(image: image)
        let bannerWidth = navigationController?.navigationBar.frame.size.width
        let bannerHeight = navigationController?.navigationBar.frame.size.height
        let bannerX = bannerWidth! / 2 - image.size.width / 2
        let bannnerY = bannerHeight! / 2 - image.size.height / 2
        imageView.frame = CGRect(x: bannerX, y: bannnerY, width: bannerWidth! / 2, height: bannerHeight! / 2)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
        //navigationController?.hidesBarsOnSwipe = true
        
        
        //Left Barbutton
        let button = UIButton.init(type: .custom)
        button.setImage(#imageLiteral(resourceName: "dismiss"), for: .normal)
        button.frame = CGRect.init(x: 0, y: 0, width: 40, height: 40)
        let barButton = UIBarButtonItem.init(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
        button.addTarget(self, action:#selector(handleDismissView), for: UIControlEvents.touchUpInside)
        
        //Right Barbutton
//        let buttonTwo = UIButton.init(type: .custom)
//        buttonTwo.setImage(#imageLiteral(resourceName: "profile"), for: .normal)
//        buttonTwo.frame = CGRect.init(x: 0, y: 0, width: 32, height: 32)
//        buttonTwo.layer.cornerRadius = 16
//        buttonTwo.layer.masksToBounds = true
//        let barButtonTwo = UIBarButtonItem.init(customView: buttonTwo)
//        self.navigationItem.rightBarButtonItem = barButtonTwo
//        button.addTarget(self, action:#selector(ViewController.callMethod), for: UIControlEvents.touchUpInside)
    }
    
    func setupViews(){
        
        
        //Main View Setup
        collectionView?.register(EventsFeedCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView?.contentInset = UIEdgeInsets(top: 66, left: 0, bottom: 0, right: 0)
        collectionView?.backgroundColor = UIColor(red:0.22, green:0.21, blue:0.23, alpha:1.00)
        navigationController?.navigationBar.barTintColor = UIColor(red:0.37, green:0.37, blue:0.38, alpha:1.00)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = UIColor.white
        
        let backButton = UIBarButtonItem()
        
        backButton.title = ""
        navigationItem.backBarButtonItem = backButton
        
        //Add Event Button
        collectionView?.addSubview(addEventButton)
        addEventButton.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        addEventButton.heightAnchor.constraint(equalToConstant: 66).isActive = true
        addEventButton.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        addEventButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    }
    
    @objc func handleAddEventButtonTapped(){
        present(UINavigationController(rootViewController: AddEventController()), animated: true, completion: nil)

    }
    
    let addEventButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        button.setTitle("+ ARRANGE EVENT", for: .normal)
        button.isEnabled = true
        button.setTitleColor(UIColor(red:0.22, green:0.21, blue:0.23, alpha:1.00), for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Bold", size: 20)
        button.layer.borderColor = UIColor(red:0.22, green:0.21, blue:0.23, alpha:1.00).cgColor
        button.layer.borderWidth = 8
        
        button.addTarget(self, action: #selector (handleAddEventButtonTapped), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    
    
    
    
}

