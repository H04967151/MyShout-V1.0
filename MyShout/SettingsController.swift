//
//  SettingsController.swift
//  MyShout
//
//  Created by Neil on 08/08/2017.
//  Copyright © 2017 Neil. All rights reserved.
//

import UIKit

class SettingsController: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    let networkCall = NetworkCalls()
    
    override init() {
        super.init()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SettingsCell.self, forCellWithReuseIdentifier: cellID)
        
    }
    
    let cellID = "settingsCell"
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let CV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        CV.backgroundColor = UIColor.white
        
        return CV
    }()
    
    let blackView = UIView()
    var height = 150 as CGFloat
    
    var eventsFeedController: EventsFeedController?
    var homeController: HomeController?
    
    func handleMenuOpen(){
        networkCall.getSettingsList()
        
        
        height = CGFloat((networkCall.settings.count * 50) + (networkCall.settings.count * 10) - 10 )
        
        if let window = UIApplication.shared.keyWindow{
            
            blackView.backgroundColor = UIColor.Colors.darkGreyTrans
            window.addSubview(blackView)
            window.addSubview(collectionView)
            
            let y = window.frame.height - height
            collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
            
            blackView.frame = window.frame
            blackView.alpha = 0
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismissMenu)))
            
            UIView.animate(withDuration: 0.2, animations: {
                self.blackView.alpha = 1
                self.collectionView.frame = CGRect(x: 0, y: y, width: window.frame.width, height: self.height)
                
            })
            
            
        }
    }
    
    
    
    @objc func handleDismissMenu(){
        
        if let window = UIApplication.shared.keyWindow{
            UIView.animate(withDuration: 0.3, animations: {
                self.blackView.alpha = 0
                self.collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: self.height)
                self.networkCall.settings.removeAll()
            })
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return networkCall.settings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? SettingsCell
        
        let setting = networkCall.settings[indexPath.row]
        cell?.settingTitleLabel.text = setting.name
        cell?.settingsImageView.image = setting.image
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            if let window = UIApplication.shared.keyWindow{
                UIView.animate(withDuration: 0.3, animations: {
                    self.blackView.alpha = 0
                    self.collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: self.height)
                    self.networkCall.settings.removeAll()
                })
            }
            
        }) { (completed: Bool) in
            
            let selectedCell = collectionView.cellForItem(at: indexPath)! as! SettingsCell
            
            if selectedCell.settingTitleLabel.text == "Cancel"{
                self.handleDismissMenu()
            }else if selectedCell.settingTitleLabel.text == "Login"{
                self.homeController?.navigationController?.pushViewController(LoginController(), animated: true)
                self.homeController?.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
            }else{
                self.homeController?.navigationController?.pushViewController((self.homeController?.detailSettingsController)!, animated: true)
                self.homeController?.detailSettingsController.title = selectedCell.settingTitleLabel.text
                self.homeController?.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
                self.homeController?.detailSettingsController.view.backgroundColor = UIColor.Colors.darkGrey
            }
            
        }
        
    }
    
}
