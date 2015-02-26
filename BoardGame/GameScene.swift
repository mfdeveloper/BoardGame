//
//  GameScene.swift
//  BoardGame
//
//  Created by Michel Felipe on 02/02/15.
//  Copyright (c) 2015 Michel Felipe. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        let cardOne = Card(imageNamed: "duke_card.jpg", options: [
            "text":"120",
            "name":"damageLabel",
            "fontName":"Arial Bold",
            "fontSize":40,
            "fontColor":UIColor(red: 0.47, green: 0.0, blue: 0.0, alpha: 1.0),
            "position":["x":40,"y":400]
        ])
        
        cardOne.position = CGPointMake(600, 200)
        
        cardOne.runAction(SKAction.scaleTo(0.3, duration: 0.0))
        
        self.addChild(cardOne)
        
        let cardTwo = Card(imageNamed: "assassin_card.png",options: nil)
        cardTwo.position = CGPointMake(400, 200)
        
        cardTwo.runAction(SKAction.scaleTo(0.3, duration: 0.0))
        
        self.addChild(cardTwo)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            let touchedNode = nodeAtPoint(location)
            
            if !touchedNode.isKindOfClass(SKSpriteNode) {
                continue
            }
            
            let pickUp = SKAction.scaleTo(0.35, duration: 0.2)
            
            touchedNode.zPosition = 15
            touchedNode.runAction(pickUp, withKey: "pickup")
            
        }
        
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        for touch in touches {
            let location = touch.locationInNode(self)
            let touchedNode = nodeAtPoint(location)
            
            if !touchedNode.isKindOfClass(SKSpriteNode){
                continue
            }
            
            let dropDown = SKAction.scaleTo(0.3, duration: 0.2)
            
            touchedNode.zPosition = 0
            touchedNode.runAction(dropDown, withKey: "drop")
            
        }
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        
        for touch in touches {
            let location = touch.locationInNode(self)
            let touchedNode = nodeAtPoint(location)
            if !touchedNode.isKindOfClass(SKSpriteNode){
                continue
            }
            
            touchedNode.position = location
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    /**
    * @todo Remove this method, after finalize the Card#newLabelWith() method
    */
    func newDamageLabel() -> SKLabelNode {
        let damageLabel = SKLabelNode(fontNamed: "Arial Bold")
        damageLabel.name = "damageLabel"
        damageLabel.fontSize = 40
        damageLabel.fontColor = UIColor(red: 0.47, green: 0.0, blue: 0.0, alpha: 1.0)
        damageLabel.text = "120"
        damageLabel.position = CGPointMake(40,400)
        
        return damageLabel
    }
}