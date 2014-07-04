//
//  GameScene.swift
//  MotionProto
//
//  Created by Jeremy Novak on 7/3/14.
//  Copyright (c) 2014 Jeremy Novak. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    // Class Properties
    var ship = Player(imageNamed: "Ship")
    
    var startMessage = SKLabelNode(fontNamed: kFontName)
    
    init(size: CGSize) {
        super.init(size: size)
    }
    
    override func didMoveToView(view: SKView) {
        self.setupWorld()
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
    }
   
    override func update(currentTime: CFTimeInterval) {
        if MotionManagerSharedInstance.deviceMotionActive {
            MotionManagerSharedInstance.updatePosition(ship)
        }
    }
    
    func setupWorld() {
        // Edge Loop
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        
        // Background
        self.backgroundColor = SKColor.blackColor()
        
        // Player
        self.addChild(ship)
    }
    
    func startGame() {
        MotionManagerSharedInstance.startMotionManager()
    }
}
