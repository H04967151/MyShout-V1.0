//
//  AddEventController.swift
//  MyShout
//
//  Created by Neil on 09/08/2017.
//  Copyright © 2017 Neil. All rights reserved.
//

import UIKit
import GooglePlaces
import GooglePlacePicker

class AddEventController: UIViewController {
    
    let addEventView = AddEventView()
    let picker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupNavBarItems()
        createDatePicker()
        addEventView.descTextView.delegate = self
    }
    
    func createDatePicker(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(datePickerDoneButtonPressed))
        toolBar.setItems([done], animated: true)
        
        addEventView.dateTextField.inputAccessoryView = toolBar
        addEventView.dateTextField.inputView = picker
    }
    
    @objc func datePickerDoneButtonPressed(){
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        
        let dateString = formatter.string(from: picker.date)
        
        addEventView.dateTextField.text = "\(dateString)"
        self.view.endEditing(true)
    }
    
    func setupViews(){
        
        
        view.backgroundColor = UIColor.white

        //Image View
        view.addSubview(addEventView.addImageView)
        addEventView.addImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        addEventView.addImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addEventView.addImageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        addEventView.addImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        //Titel Label
        view.addSubview(addEventView.eventTitleTextField)
        addEventView.eventTitleTextField.topAnchor.constraint(equalTo: addEventView.addImageView.bottomAnchor, constant: 8).isActive = true
        addEventView.eventTitleTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -16).isActive = true
        addEventView.eventTitleTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addEventView.eventTitleTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //Description Text View
        view.addSubview(addEventView.descTextView)
        addEventView.descTextView.topAnchor.constraint(equalTo: addEventView.eventTitleTextField.bottomAnchor, constant: 8).isActive = true
        addEventView.descTextView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -16).isActive = true
        addEventView.descTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addEventView.descTextView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        //Description Label Placeholder
        view.addSubview(addEventView.descriptionPlaceholderText)
        addEventView.descriptionPlaceholderText.topAnchor.constraint(equalTo: addEventView.eventTitleTextField.bottomAnchor, constant: 16).isActive = true
        addEventView.descriptionPlaceholderText.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -16).isActive = true
        addEventView.descriptionPlaceholderText.heightAnchor.constraint(equalToConstant: 24).isActive = true
        addEventView.descriptionPlaceholderText.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 7).isActive = true
        
        //Date Icon
        view.addSubview(addEventView.calIcon)
        addEventView.calIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        addEventView.calIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        addEventView.calIcon.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        addEventView.calIcon.topAnchor.constraint(equalTo: addEventView.descTextView.bottomAnchor, constant: 22).isActive = true
        
        //Date Label
        view.addSubview(addEventView.dateTextField)
        addEventView.dateTextField.topAnchor.constraint(equalTo: addEventView.descTextView.bottomAnchor, constant: 16).isActive = true
        addEventView.dateTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -16).isActive = true
        addEventView.dateTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        addEventView.dateTextField.leftAnchor.constraint(equalTo: addEventView.calIcon.rightAnchor, constant: 8).isActive = true
        
        //Location Icon
        view.addSubview(addEventView.locationIcon)
        addEventView.locationIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        addEventView.locationIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        addEventView.locationIcon.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        addEventView.locationIcon.topAnchor.constraint(equalTo: addEventView.dateTextField.bottomAnchor, constant: 22).isActive = true
        
        
        //Location Name Label
        view.addSubview(addEventView.locationNameTextField)
        addEventView.locationNameTextField.topAnchor.constraint(equalTo: addEventView.dateTextField.bottomAnchor, constant: 16).isActive = true
        addEventView.locationNameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -42).isActive = true
        addEventView.locationNameTextField.leftAnchor.constraint(equalTo: addEventView.locationIcon.rightAnchor, constant: 8).isActive = true
        addEventView.locationNameTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //Location Addres Label
        view.addSubview(addEventView.locationAddressTextView)
        addEventView.locationAddressTextView.topAnchor.constraint(equalTo: addEventView.locationNameTextField.bottomAnchor, constant: 4).isActive = true
        addEventView.locationAddressTextView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -42).isActive = true
        addEventView.locationAddressTextView.leftAnchor.constraint(equalTo: addEventView.locationIcon.rightAnchor, constant: 4).isActive = true
        addEventView.locationAddressTextView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //Save Event Button
        view.addSubview(addEventView.saveEventButton)
        addEventView.saveEventButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -16).isActive = true
        addEventView.saveEventButton.heightAnchor.constraint(equalToConstant: 66).isActive = true
        addEventView.saveEventButton.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
        addEventView.saveEventButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        
        
        
    }
    
    @objc func handleDismissView(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func userDidTapSaveButton(){
        let name = addEventView.eventTitleTextField.text
        let description = addEventView.descTextView.text
        let date = addEventView.dateTextField.text
        let location = addEventView.locationNameTextField.text! + addEventView.locationAddressTextView.text
        let image = addEventView.addImageView.image
        
        let event = EventObject(name: name, descriptionText: description, date: date, location: location, imageURL: image)
        print(event.name as Any)
        dismiss(animated: true, completion: nil)
    }
    
    func setupNavBarItems(){
        
        //Main Nav Setup
        navigationController?.navigationBar.barTintColor = UIColor(red:0.37, green:0.37, blue:0.38, alpha:1.00)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = UIColor.white
        
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
//        buttonTwo.setImage(#imageLiteral(resourceName: "share"), for: .normal)
//        buttonTwo.frame = CGRect.init(x: 0, y: 0, width: 32, height: 32)
//        buttonTwo.layer.masksToBounds = true
//        let barButtonTwo = UIBarButtonItem.init(customView: buttonTwo)
//        self.navigationItem.rightBarButtonItem = barButtonTwo
//        button.addTarget(self, action:#selector(ViewController.callMethod), for: UIControlEvents.touchUpInside)
    }
}

extension AddEventController : UITextViewDelegate {
    
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        if addEventView.descTextView.text.characters.count <= 0{
            addEventView.descriptionPlaceholderText.text = "Description"
        }else{
            addEventView.descriptionPlaceholderText.text = ""
        }
    }
    
}

extension AddEventController : GMSPlacePickerViewControllerDelegate{
    
    
    @objc func getUsersLocation(){
        let config = GMSPlacePickerConfig(viewport: nil)
        let placePicker = GMSPlacePickerViewController(config: config)
        placePicker.delegate = self
        
        present(placePicker, animated: true, completion: nil)
    }
    
    
    func placePicker(_ viewController: GMSPlacePickerViewController, didPick place: GMSPlace) {
        self.loadFirstPhotoForPlace(placeID: place.placeID)
        let name = place.name
        guard let address = place.formattedAddress else {return}
        
        addEventView.locationNameTextField.text = "\(name)"
        addEventView.locationAddressTextView.text = "\(address)"
        viewController.dismiss(animated: true, completion: nil)
    }
    
    func placePickerDidCancel(_ viewController: GMSPlacePickerViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
    
    func loadFirstPhotoForPlace(placeID: String) {
        GMSPlacesClient.shared().lookUpPhotos(forPlaceID: placeID) { (photos, error) -> Void in
            if let error = error {
                // TODO: handle the error.
                print("Error: \(error.localizedDescription)")
            } else {
                if let firstPhoto = photos?.results.first {
                    self.loadImageForMetadata(photoMetadata: firstPhoto)
                }
            }
        }
    }
    
    func loadImageForMetadata(photoMetadata: GMSPlacePhotoMetadata) {
        GMSPlacesClient.shared().loadPlacePhoto(photoMetadata, callback: {
            (photo, error) -> Void in
            if let error = error {
                // TODO: handle the error.
                print("Error: \(error.localizedDescription)")
            } else {
                self.addEventView.addImageView.image = photo;
            }
        })
    }
    
    
}
