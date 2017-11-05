//
//  HomeController.swift
//  MyShout
//
//  Created by Neil on 09/08/2017.
//  Copyright © 2017 Neil. All rights reserved.
//

import UIKit
import SafariServices

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let reuseIdentifier = "HomeCell"
    let settingsController = SettingsController()
    let networkCall = NetworkCalls()

    override func viewDidLoad() {
        super.viewDidLoad()
        networkCall.getMenuItems()
        setupNavBarItems()

        self.collectionView!.register(HomeCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView?.dataSource = self
        collectionView?.delegate = self
    }
    
    let detailSettingsController = UIViewController()
    
    @objc func handleMenuButtonTapped(){
        settingsController.homeController = self
        settingsController.handleMenuOpen()
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return networkCall.HomeMenuItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? HomeCell
        
        let menuItem = networkCall.HomeMenuItems[indexPath.row]
        
        cell?.backgroundImage.image = menuItem.backgroundImage
        cell?.menuTitle.text = menuItem.title
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item <= 1{
            return CGSize(width: view.frame.width, height: (view.frame.height - 107) / 2)
        }else{
           return CGSize(width: view.frame.width, height: 75)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath)! as! HomeCell
        if selectedCell.menuTitle.text == " ORDER "{
            let alert = UIAlertController(title: "COMING SOON", message: "This feature is coming soon!! \n Check back later", preferredStyle: .alert)
            alert.addAction(.init(title: "👍", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if selectedCell.menuTitle.text == " EVENTS "{
            let layout = UICollectionViewFlowLayout()
            present(UINavigationController(rootViewController: EventsFeedController(collectionViewLayout: layout)), animated: true, completion: nil)
        }else{
            let safariVC = SFSafariViewController(url: NSURL(string: "https://www.slugandlettuce.co.uk/canarywharf")! as URL)
            self.present(safariVC, animated: true, completion: nil)
        }
    }
    
    func setupNavBarItems(){
        
        //Main Nav Setup
        collectionView?.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
        collectionView?.backgroundColor = UIColor(red:0.22, green:0.21, blue:0.23, alpha:1.00)
        navigationController?.navigationBar.barTintColor = UIColor(red:0.37, green:0.37, blue:0.38, alpha:1.00)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = UIColor.white
        
        
        //Brand
        let image = #imageLiteral(resourceName: "brand")
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
        button.setImage(#imageLiteral(resourceName: "menu"), for: .normal)
        button.frame = CGRect.init(x: 0, y: 0, width: 40, height: 10)
        let barButton = UIBarButtonItem.init(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
        button.addTarget(self, action:#selector(handleMenuButtonTapped), for: UIControlEvents.touchUpInside)
        
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

}
