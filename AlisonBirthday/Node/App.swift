//
//  BaseApp.swift
//  AlisonBirthday
//
//  Created by Poon Ka Hang on 3/2/2015.
//  Copyright (c) 2015年 Green Tomato. All rights reserved.
//

import SpriteKit

struct PhysicsCategory {
    static let None      : UInt32 = 0
    static let All       : UInt32 = UInt32.max
    static let App       : UInt32 = 0b1       // 1
    static let Shit      : UInt32 = 0b10      // 2
}

class App: SKSpriteNode {
    var score : Int = 0
    
    override init() {
        super.init()
    }
    
    override init(texture: SKTexture!, color: UIColor!, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        self.physicsBody = SKPhysicsBody(rectangleOfSize: size)
        self.physicsBody?.dynamic = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(#min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    func move(){
        let size = UIScreen.mainScreen().bounds.size;
        // Determine where to spawn the monster along the Y axis
        let actualX = random(min: self.size.width/2, max: size.width - self.size.width/2)
        
        // Position the monster slightly off-screen along the right edge,
        // and along a random position along the Y axis as calculated above
        self.position = CGPoint(x:actualX , y: size.height - self.size.height/2)
        
        let actualDuration = random(min: CGFloat(2.0), max: CGFloat(4.0))
        
        // Create the actions
        let actionMove = SKAction.moveTo(CGPoint(x: actualX, y: self.size.height/2), duration: NSTimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        self.runAction(SKAction.sequence([actionMove, actionMoveDone]))
    }
}