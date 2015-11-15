//
//  GameScene.swift
//  RWCCG
//
//  Created by Brian Broom on 7/1/14.
//  Copyright (c) 2014 Brian Broom. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView)
    {
        let wolf = Card(imageNamed: "card_creature_wolf.png")
        wolf.position = CGPointMake(100, 200)
        addChild(wolf)
        
        let bear = Card(imageNamed: "card_creature_bear.png")
        bear.position = CGPointMake(300, 200)
        addChild(bear)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        for touch in touches
        {
            let location    = touch.locationInNode(self)
            let touchedNode = nodeAtPoint(location)
            touchedNode.zPosition = 15
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        for touch in touches
        {
            let location    = touch.locationInNode(self)
            let touchedNode = nodeAtPoint(location)
            touchedNode.position = location
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        for touch in touches
        {
            let location    = touch.locationInNode(self)
            let touchedNode = nodeAtPoint(location)
            touchedNode.zPosition = 0
        }
    }
    
}
