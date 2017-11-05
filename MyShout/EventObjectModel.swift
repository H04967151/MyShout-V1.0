//
//  EventObjectModel.swift
//  MyShout
//
//  Created by Neil on 08/08/2017.
//  Copyright © 2017 Neil. All rights reserved.
//

import UIKit

class EventObject: NSObject {
    
    let name: String?
    let descriptionText: String?
    let date: String?
    let location: String?
    let imageURL: UIImage?
    
    init(name: String?, descriptionText: String?, date: String?, location: String?, imageURL: UIImage?) {
        
        self.name = name
        self.descriptionText = descriptionText
        self.date = date
        self.location = location
        self.imageURL = imageURL
    
    }

}
