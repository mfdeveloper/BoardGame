//
//  SKLabelNodeExt.swift
//  BoardGame
//
//  Created by Michel Felipe on 27/02/15.
//  Copyright (c) 2015 Michel Felipe. All rights reserved.
//

import Foundation
import SpriteKit

extension SKLabelNode{
    
    subscript(property: String) -> Any?{
        
        get{
            
            switch property {
                
            case "name":
                return name
                
            case "fontSize":
                return fontSize
                
            case "fontColor":
                return fontColor
                
            case "fontName":
                return fontName
                
            case "text":
                return text
                
            case "position":
                return position
                
            default:
                return nil
            }
        }
        
        set {
            
            switch property {
                
            case "name":
                name = newValue as? String
                
            case "fontSize":
                fontSize = CGFloat((newValue as NSNumber).doubleValue)
                
            case "fontColor":
                fontColor = newValue as UIColor
                
            case "fontName":
                fontName = newValue as String
                
            case "text":
                text = newValue as String
                
                /*
                * @todo Refactor this case to override set method of 'position'
                *       attribute of SKLabelNode class
                */
            case "position":
                
                switch newValue{
                    
                case let collectPos as [Int]:
                    let x = CGFloat((collectPos[0] as NSNumber).doubleValue)
                    let y = CGFloat((collectPos[1] as NSNumber).doubleValue)
                    
                    position = CGPointMake(x,y)
                    
                case let stringPos as String:
                    var splitedPos = stringPos.componentsSeparatedByString(",")
                    let x = CGFloat(CFStringGetDoubleValue(splitedPos[0]))
                    let y = CGFloat(CFStringGetDoubleValue(splitedPos[1]))
                    
                    position = CGPointMake(x,y)
                    
                case let dictPos as Dictionary<String,Int>:
                    
                    let x = CGFloat((dictPos["x"]! as NSNumber).doubleValue)
                    let y = CGFloat((dictPos["y"]! as NSNumber).doubleValue)
                    
                    position = CGPointMake(x, y)
                    
                default:
                    position = newValue as CGPoint
                    
                }
                
            default:
                0
                
            }
        }
        
    }
}