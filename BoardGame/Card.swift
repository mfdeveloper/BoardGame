//
//  Card.swift
//  BoardGame
//
//  Created by Michel Felipe on 02/02/15.
//  Copyright (c) 2015 Michel Felipe. All rights reserved.
//

import Foundation
import SpriteKit


class Card: SKSpriteNode {
    
    var textures = [
        "front":"back_card.png",
        "back":"back_card.jpg"
    ]
    
    var faceUp = true
    
    required init(coder aDecoder: NSCoder){
        
        fatalError("NSCoding not supported")
    }
    
    init(var imageNamed: String, options:[String:Any]?){
        
        var cardTexture = SKTexture(imageNamed: imageNamed)
        
        if let cfgs = options {
            
            if let fUp = cfgs["faceUp"] as? Bool{
                
                if !fUp{
                    cardTexture = SKTexture(imageNamed: textures["back"]!)
                }
            }
        }
        
        super.init(texture: cardTexture, color: nil, size: cardTexture.size())
        setTextureOf("front", file: imageNamed)
        
        if let opts = options {
            
            let label = newLabelWith(opts)
            addChild(label)
        }
        
    }
    
    func getTextureOf(name:String) -> SKTexture?{
        
        if let textureFile = textures[name]{
            return SKTexture(imageNamed: textures[name]!)
        }else{
        
            return nil
        }
    }
    
    func setTextureOf(name:String, file:String){
        
        textures[name] = file
    }
    
    private func newLabelWith(var options:[String:Any]) -> SKLabelNode{
        
        let label = SKLabelNode()
        
        for (propName, propValue) in options {

            label[propName] = propValue
        }
        
        return label
    }
}