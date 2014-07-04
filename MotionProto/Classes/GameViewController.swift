//
//  GameViewController.swift
//  MotionProto
//
//  Created by Jeremy Novak on 7/3/14.
//  Copyright (c) 2014 Jeremy Novak. All rights reserved.
//

import UIKit
import SpriteKit


class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let skView = self.view as SKView
        kViewSize = skView.bounds.size
        
        if kDebug {
            skView.showsDrawCount = true
            skView.showsFPS = true
            skView.showsNodeCount = true
            skView.showsPhysics = true
        }
        
        skView.ignoresSiblingOrder = true
        
        let gameScene = GameScene(size: kViewSize)
        gameScene.scaleMode = SKSceneScaleMode.AspectFill
        skView.presentScene(gameScene)
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func prefersStatusBarHidden() -> Bool  {
        return true
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.LandscapeLeft.toRaw())
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
