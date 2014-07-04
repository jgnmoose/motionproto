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
    
    var isUpdating = false
    
    class var sharedInstance:MotionManager {
        return MotionManagerSharedInstance
    }
    
    func startMotionManager() {
        if !self.deviceMotionActive {
            self.deviceMotionUpdateInterval = 0.1
            self.startDeviceMotionUpdatesUsingReferenceFrame(CMAttitudeReferenceFrameXArbitraryCorrectedZVertical, toQueue: NSOperationQueue.currentQueue(), withHandler: {
                    deviceManager, error in
                self.isUpdating = true
            })
        }
    }
    
    func stopMotionManager() {
        if self.deviceMotionActive {
            self.stopDeviceMotionUpdates()
            self.isUpdating = false
        }
    }
    
    
    func radiansToDegrees(radians:Double) -> CGFloat {
        return CGFloat(radians * 180 / M_PI)
    }
    
    
    func updatePosition(node: SKNode) {
        if let data = self.deviceMotion {
            
            let forceX = self.radiansToDegrees(-data.rotationRate.x / 2)
            let forceY = self.radiansToDegrees(-data.rotationRate.y / 2)
            
            node.physicsBody.applyForce(CGVectorMake(forceX, forceY))
        }
    }
}