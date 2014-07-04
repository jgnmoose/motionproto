//
//  MotionManager.swift
//  MotionProto
//
//  Created by Jeremy Novak on 7/3/14.
//  Copyright (c) 2014 Jeremy Novak. All rights reserved.
//

import CoreMotion
import SpriteKit

let MotionManagerSharedInstance = MotionManager()

class MotionManager:CMMotionManager {
    class var sharedInstance:MotionManager {
        return MotionManagerSharedInstance
    }
    
    func startMotionManager() {
        if !self.gyroActive {
            self.startGyroUpdates()
        }
    }
    
    func stopMotionManager() {
        if self.gyroActive {
            self.stopGyroUpdates()
        }
    }
    
    
    func radiansToDegrees(radians:CGFloat) -> CGFloat {
        return (CGFloat(radians) * CGFloat(180.0 / M_PI))
    }
    
    
    func updatePosition(node: SKNode) {
        if let data = self.gyroData {
            let forceX = self.radiansToDegrees(CGFloat(-data.rotationRate.x / 2))
            let forceY = self.radiansToDegrees(CGFloat(-data.rotationRate.y / 2))
            
            node.physicsBody.applyForce(CGVectorMake(forceX, forceY))
        }
    }
}