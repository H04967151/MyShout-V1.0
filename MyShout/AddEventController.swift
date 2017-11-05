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
    
    let aeView = AddEventView()
    let picker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupNavBarItems()
        createDatePicker()
        aeView.descTextView.delegate = self
    }
    
    func createDatePicker(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(datePickerDoneButtonPressed))
        toolBar.setItems([done], animated: true)
        
        aeView.dateTextField.inputAccessoryView = toolBar
        aeView.dateTextField.inputView = picker
    }
    
    @objc func datePickerDoneButtonPressed(){
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        
        let dateString = formatter.string(from: picker.date)
        
        aeView.dateTextField.text = "\(dateString)"
        self.view.endEditing(true)
    }
    
    func setupViews(){
        
        
        view.backgroundColor = UIColor.white

        //Image View
        view.addSubview(aeView.addImageView)
        aeView.addImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        aeView.addImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        aeView.addImageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        aeView.addImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        //Titel Label
        view.addSubview(aeView.eventTitleTextField)
        aeView.eventTitleTextField.topAnchor.constraint(equalTo: aeView.addImageView.bottomAnchor, constant: 8).isActive = true
        aeView.eventTitleTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -16).isActive = true
        aeView.eventTitleTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        aeView.eventTitleTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //Description Text View
        view.addSubview(aeView.descTextView)
        aeView.descTextView.topAnchor.constraint(equalTo: aeView.eventTitleTextField.bottomAnchor, constant: 8).isActive = true
        aeView.descTextView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -16).isActive = true
        aeView.descTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        aeView.descTextView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        //Description Label Placeholder
        view.addSubview(aeView.descriptionPlaceholderText)
        aeView.descriptionPlaceholderText.topAnchor.constraint(equalTo: aeView.eventTitleTextField.bottomAnchor, constant: 16).isActive = true
        aeView.descriptionPlaceholderText.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -16).isActive = true
        aeView.descriptionPlaceholderText.heightAnchor.constraint(equalToConstant: 24).isActive = true
        aeView.descriptionPlaceholderText.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 7).isActive = true
        
        //Date Icon
        view.addSubview(aeView.calIcon)
        aeView.calIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        aeView.calIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        aeView.calIcon.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        aeView.calIcon.topAnchor.constraint(equalTo: aeView.descTextView.bottomAnchor, constant: 22).isActive = true
        
        //Date Label
        view.addSubview(aeView.dateTextField)
        aeView.dateTextField.topAnchor.constraint(equalTo: aeView.descTextView.bottomAnchor, constant: 16).isActive = true
        aeView.dateTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -16).isActive = true
        aeView.dateTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        aeView.dateTextField.leftAnchor.constraint(equalTo: aeView.calIcon.rightAnchor, constant: 8).isActive = true
        
        //Location Icon
        view.addSubview(aeView.locationIcon)
        aeView.locationIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        aeView.locationIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        aeView.locationIcon.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        aeView.locationIcon.topAnchor.constraint(equalTo: aeView.dateTextField.bottomAnchor, constant: 22).isActive = true
        
        
        //Location Name Label
        view.addSubview(aeView.locationNameTextField)
        aeView.locationNameTextField.topAnchor.constraint(equalTo: aeView.dateTextField.bottomAnchor, constant: 16).isActive = true
        aeView.locationNameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -42).isActive = true
        aeView.locationNameTextField.leftAnchor.constraint(equalTo: aeView.locationIcon.rightAnchor, constant: 8).isActive = true
        aeView.locationNameTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //Location Addres Label
        view.addSubview(aeView.locationAddressTextView)
        aeView.locationAddressTextView.topAnchor.constraint(equalTo: aeView.locationNameTextField.bottomAnchor, constant: 4).isActive = true
        aeView.locationAddressTextView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -42).isActive = true
        aeView.locationAddressTextView.leftAnchor.constraint(equalTo: aeView.locationIcon.rightAnchor, constant: 4).isActive = true
        aeView.locationAddressTextView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //Save Event Button
        view.addSubview(aeView.saveEventButton)
        aeView.saveEventButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -16).isActive = true
        aeView.saveEventButton.heightAnchor.constraint(equalToConstant: 66).isActive = true
        aeView.saveEventButton.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
        aeView.saveEventButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        
        
        
    }
    
    @objc func handleDismissView(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func userDidTappSaveButton(){
        let name = aeView.eventTitleTextField.text
        let description = aeView.descTextView.text
        let date = aeView.dateTextField.text
        let location = aeView.locationNameTextField.text! + aeView.locationAddressTextView.text
        let image = aeView.addImageView.image
        
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
        if aeView.descTextView.text.characters.count <= 0{
            aeView.descriptionPlaceholderText.text = "Description"
        }else{
            aeView.descriptionPlaceholderText.text = ""
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
        
        aeView.locationNameTextField.text = "\(name)"
        aeView.locationAddressTextView.text = "\(address)"
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
                self.aeView.addImageView.image = photo;
            }
        })
    }
    
    
}
