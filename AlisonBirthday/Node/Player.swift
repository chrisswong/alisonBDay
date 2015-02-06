//
//  Player.swift
//  AlisonBirthday
//
//  Created by Poon Ka Hang on 4/2/2015.
//  Copyright (c) 2015年 Green Tomato. All rights reserved.
//
import SpriteKit

class Player: SKSpriteNode {
    let actionMoveLeft:SKAction = SKAction.moveByX(-300,y: 0,duration:1)
    let actionMoveRight:SKAction = SKAction.moveByX(300,y: 0,duration:1);
    
    override init() {
        let texture = SKTexture(imageNamed: "player")
        super.init(texture: texture, color: nil, size: texture.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func moveToLeft(){
        self.runAction(actionMoveLeft);
    }
    
    func moveToRight(){
        self.runAction(actionMoveRight);
    }
    
    func stop(){
        self.removeAllActions();
    }
}