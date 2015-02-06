//
//  GameScene.swift
//  AlisonBirthday
//
//  Created by Poon Ka Hang on 3/2/2015.
//  Copyright (c) 2015年 Green Tomato. All rights reserved.
//

import Foundation
import SpriteKit

class GameScene: SKScene {
    // 1
    let player = Player()
    
    override func didMoveToView(view: SKView) {
        backgroundColor = SKColor.whiteColor()
        player.position = CGPoint(x: size.width * 0.5, y: size.height * 0.1)
        addChild(player)

        runAction(SKAction.repeatActionForever(
            SKAction.sequence([
                SKAction.runBlock(createApp),
                SKAction.waitForDuration(1.0)
                ])
            ))
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        // 1 - Choose one of the touches to work with
        let touch = touches.anyObject() as UITouch
        let touchLocation = touch.locationInNode(self.scene)
        
        if(touchLocation.x > self.size.width/CGFloat(2.0)){
            player.moveToRight();
        }else{
            player.moveToLeft();
        }
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        // 1 - Choose one of the touches to work with
        let touch = touches.anyObject() as UITouch
        let touchLocation = touch.locationInNode(self)
        
        player.stop();
        
        
    }
    
//    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
//        /* Called when a touch begins */
//    
//        }
//    }
//   
//    override func update(currentTime: CFTimeInterval) {
//        /* Called before each frame is rendered */
//    }
    
    func createApp(){
        let app:App = AppFactory.sharedInstance.createApp()
        addChild(app)
        app.move()
    }
    
    func GameOver(){
        let reveal = SKTransition.flipHorizontalWithDuration(0.5)
        let gameOverScene = GameOverScene(size: self.size, won: false)
        self.view?.presentScene(gameOverScene, transition: reveal)
    }
}
