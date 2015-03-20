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
        
        let cardOne = Card(imageNamed: "duke_card.jpg",
                           labels: [
                                [
                                    "text":"120",
                                    "name":"damageLabel",
                                    "fontName":"Arial Bold",
                                    "fontSize":40,
                                    "fontColor":UIColor(red: 0.47, green: 0.0, blue: 0.0, alpha: 1.0),
                                    "position":["x":40,"y":400]
                                ]
                            ],
                            options:[
                                "faceUp":true
                            ])
        
        cardOne.position = CGPointMake(600, 200)
        
        cardOne.runAction(SKAction.scaleTo(0.3, duration: 0.0))
        
        self.addChild(cardOne)
        
        let cardTwo = Card(imageNamed: "assassin_card.png", labels:nil,options: nil)
        cardTwo.position = CGPointMake(400, 200)
        
        cardTwo.runAction(SKAction.scaleTo(0.3, duration: 0.0))
        
        self.addChild(cardTwo)
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}