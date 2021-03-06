//
//  GameScene.swift
//  MotionProto
//
//  Created by Jeremy Novak on 7/3/14.
//  Copyright (c) 2014 Jeremy Novak. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var viewSize:CGSize!
    var ship:Player!
    var startMessage = SKLabelNode(fontNamed: kFontName)
    
    init(size: CGSize) {
        super.init(size: size)
    }
    
    override func didMoveToView(view: SKView) {
        viewSize = self.frame.size
        self.setupWorld()
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        let touch:UITouch = touches.anyObject() as UITouch
        let touchLocation = touch.locationInNode(self)
        
        if startMessage.containsPoint(touchLocation) {
            self.startGame()
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        if MotionManagerSharedInstance.isUpdating {
            MotionManagerSharedInstance.updatePosition(ship)
        }
    }
    
    func setupWorld() {
        // Edge Loop
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        
        // Background
        self.backgroundColor = SKColor.blackColor()
        
        // Player
        let texture = GameTexturesSharedInstance.textureAtlas.textureNamed("Ship")
        ship = Player(texture: texture, color: SKColor.whiteColor(), size: texture.size())
        self.addChild(ship)
        
        // Message
        startMessage.fontSize = 64.0
        startMessage.fontColor = SKColor.whiteColor()
        startMessage.text = "Tap to Start"
        startMessage.position = CGPoint(x: viewSize.width / 2, y: viewSize.height / 2)
        startMessage.zPosition = GameLayer.Background
        self.addChild(startMessage)
    }
    
    func startGame() {
        startMessage.hidden = true
        MotionManagerSharedInstance.startMotionManager()
    }
}
