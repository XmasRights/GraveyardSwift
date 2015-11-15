//
//  Card.swift
//  RWCCG
//
//  Created by Brian Broom on 7/22/14.
//  Copyright (c) 2014 Brian Broom. All rights reserved.
//

import Foundation
import SpriteKit

class Card: SKSpriteNode
{
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("NSCoding not supported")
    }
    
    init(imageNamed: String)
    {
        let cardTexture = SKTexture(imageNamed: imageNamed)
        super.init(texture: cardTexture, color: UIColor.clearColor(), size: cardTexture.size())
        
        self.addChild(newDamageLabel())
    }


    // =============================================================
    // MARK: Actions
    // =============================================================
    
    func lift()
    {
        let liftAction = SKAction.scaleTo(1.6, duration: 0.2)
        self.runAction(liftAction)
    }
    
    func drop()
    {
        let dropAction = SKAction.scaleTo(1.0, duration: 0.2)
        self.runAction(dropAction)
    }

    func startWiggle()
    {
        let rotR = SKAction.rotateByAngle(0.15, duration: 0.2)
        let rotL = SKAction.rotateByAngle(-0.15, duration: 0.2)
        let cycle = SKAction.sequence([rotR, rotL, rotL, rotR])
        let wiggle = SKAction.repeatActionForever(cycle)
        self.runAction(wiggle, withKey: "wiggle")
    }
    
    func stopWiggle()
    {
        self.removeActionForKey("wiggle")
        self.runAction(SKAction.rotateToAngle(0, duration: 0.2))
    }
    
    
    // =============================================================
    // MARK: Damage
    // =============================================================
    
    private func newDamageLabel() -> SKLabelNode
    {
        let damageLabel       = SKLabelNode(fontNamed: "OpenSans-Bold")
        damageLabel.name      = "damageLabel"
        damageLabel.fontSize  = 12
        damageLabel.fontColor = UIColor(red: 0.47, green: 0.0, blue: 0.0, alpha: 1.0)
        damageLabel.text      = "0"
        damageLabel.position  = CGPointMake(25, 40)
        
        return damageLabel
    }
    
}
