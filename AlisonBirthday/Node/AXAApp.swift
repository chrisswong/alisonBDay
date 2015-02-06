//
//  AXAApp.swift
//  AlisonBirthday
//
//  Created by Poon Ka Hang on 3/2/2015.
//  Copyright (c) 2015年 Green Tomato. All rights reserved.
//
import SpriteKit

class AXAapp: App {
    override init() {
        let texture = SKTexture(imageNamed: "axa")
        super.init(texture: texture, color: nil, size: texture.size())
        
        self.score = 3
        self.physicsBody?.categoryBitMask = PhysicsCategory.App // 3
        self.physicsBody?.contactTestBitMask = PhysicsCategory. // 4
        self.physicsBody?.collisionBitMask = PhysicsCategory.None // 5
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}