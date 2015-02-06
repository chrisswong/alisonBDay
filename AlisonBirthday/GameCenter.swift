//
//  GameCenter.swift
//  AlisonBirthday
//
//  Created by Poon Ka Hang on 4/2/2015.
//  Copyright (c) 2015年 Green Tomato. All rights reserved.
//

import Foundation

class GameCenter : NSObject{
    var score : Int = 0     //Game Score
    var life : Int = 0
    
    class var sharedInstance : GameCenter {
        struct Static {
            static var onceToken : dispatch_once_t = 0
            static var instance : GameCenter? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = GameCenter()
        }
        return Static.instance!
    }
    
    override init(){
        score = 0
        life = 3
        super.init()
    }
    
    func reset(){   //reset all game setting
        
    }

}
