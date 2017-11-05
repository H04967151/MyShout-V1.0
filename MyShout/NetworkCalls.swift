//
//  NetworkCalls.swift
//  MyShout
//
//  Created by Neil on 08/08/2017.
//  Copyright © 2017 Neil. All rights reserved.
//

import Foundation


class NetworkCalls {
    
    
    var events = [EventObject]()
    
    let eventOne = EventObject(name: "Jasons Birthday Bash", descriptionText: "Come and join Jason at the Slug & Lettuce to celebrate his birthday. First drink is on Jason", date: "Friday 11th August - 17:00", location: "Slug & Lettuce Canary Wharf", imageURL: #imageLiteral(resourceName: "slug"))
    
    
    let eventTwo = EventObject(name: "Friday Drinks", descriptionText: "Its been a long week! Come and join the team at Rum & Sugar for a drink or two. Open to all.", date: "Friday 11th August - 16:30", location: "Rum and Sugar Canary Wharf", imageURL: #imageLiteral(resourceName: "rum and sugar"))
    
    let eventThree = EventObject(name: "Two for One Drinks", descriptionText: "Join the team at Rocket for 2 for 1 drinks untill 9pm this Friday.", date: "Thursday 10th August - 15:00", location: "Rocket Canary Wharf", imageURL: #imageLiteral(resourceName: "Rocket"))
    
    
    func callNetwork(){
        events.append(eventOne)
        events.append(eventTwo)
        events.append(eventThree)
    }
    
    var settings = [SettingsObject]()
    
    
    let settingOne = SettingsObject(name: "Settings", image: #imageLiteral(resourceName: "settings"))
    let settingTwo = SettingsObject(name: "Contact Support", image: #imageLiteral(resourceName: "contact"))
    let settingThree = SettingsObject(name: "Report Issue", image: #imageLiteral(resourceName: "danger"))
    let settingFour = SettingsObject(name: "Cancel", image: #imageLiteral(resourceName: "multiply"))
    
    func getSettingsList(){
        settings.append(settingOne)
        settings.append(settingTwo)
        settings.append(settingThree)
        settings.append(settingFour)
    }
    
    var HomeMenuItems = [HomeMenuObject]()
    
    let menuItemOne = HomeMenuObject(backgroundImage: #imageLiteral(resourceName: "pub"), title: " EVENTS ")
    let menuItemTwo = HomeMenuObject(backgroundImage: #imageLiteral(resourceName: "beer pumps"), title: " ORDER ")
    let menuItemThree = HomeMenuObject(backgroundImage: #imageLiteral(resourceName: "bud-ad"), title: "")
    
    
    func getMenuItems(){
        HomeMenuItems.append(menuItemOne)
        HomeMenuItems.append(menuItemTwo)
        HomeMenuItems.append(menuItemThree)
    }
    
    
    
}
