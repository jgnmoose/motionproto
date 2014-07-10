//
//  Player.swift
//  MotionProto
//
//  Created by Jeremy Novak on 7/3/14.
//  Copyright (c) 2014 Jeremy Novak. All rights reserved.
//

import SpriteKit

class Player:SKSpriteNode {
    
    let startPosition = CGPoint(x: viewSize.width / 2, y: viewSize.height / 2)
    let namePlayer = "Player"
    
    init(texture: SKTexture!, color: UIColor!, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        
        self.playerSetup()
    }
    
    
    func playerSetup() {
        // Texture Properties
        self.texture.filteringMode = SKTextureFilteringMode.Nearest
        
        // Position
        self.position = startPosition
        self.zPosition = GameLayer.Game
        
        // Other Properites
        self.name = namePlayer
        
        // Physics
        self.physicsBody = SKPhysicsBody(circleOfRadius: self.size.height / 2)
        self.physicsBody.dynamic = true
        self.physicsBody.allowsRotation = false
        self.physicsBody.linearDamping = 1.0 
        self.physicsBody.angularDamping = 1.0
        self.physicsBody.affectedByGravity = false
        self.physicsBody.categoryBitMask = Contact.Player
        self.physicsBody.collisionBitMask = Contact.Alien | Contact.AlienMissile | Contact.AlienTorpedo
        self.physicsBody.contactTestBitMask = Contact.Alien | Contact.AlienMissile | Contact.AlienTorpedo
    }
}
