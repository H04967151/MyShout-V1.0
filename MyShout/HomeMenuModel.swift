//
//  HomeMenuModel.swift
//  MyShout
//
//  Created by Neil on 09/08/2017.
//  Copyright © 2017 Neil. All rights reserved.
//

import UIKit

class HomeMenuObject: NSObject {
    
    let backgroundImage: UIImage?
    let title: String?
    //let controller: UIViewController?
    
    init(backgroundImage: UIImage, title: String) {
        self.backgroundImage = backgroundImage
        self.title = title
        //self.controller = controller
    }

}
