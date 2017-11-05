//
//  SettingsModel.swift
//  MyShout
//
//  Created by Neil on 08/08/2017.
//  Copyright © 2017 Neil. All rights reserved.
//

import UIKit

class SettingsObject: NSObject {
    var name: String?
    var image: UIImage?
    
    init(name: String, image: UIImage) {
        self.name = name
        self.image = image
    }

}
