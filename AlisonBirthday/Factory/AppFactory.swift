//
//  AppFactory.swift
//  AlisonBirthday
//
//  Created by Poon Ka Hang on 4/2/2015.
//  Copyright (c) 2015年 Green Tomato. All rights reserved.
//

import Foundation

class AppFactory : NSObject{

    class var sharedInstance : AppFactory {
        struct Static {
            static var onceToken : dispatch_once_t = 0
            static var instance : AppFactory? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = AppFactory()
        }
        return Static.instance!
    }
    
    func createApp() -> App {
        let app:App = AXAapp()
        return app
    }
}