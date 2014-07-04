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
        if !self.deviceMotionActive {
            self.startDeviceMotionUpdatesUsingReferenceFrame(CMAttitudeReferenceFrameXArbitraryCorrectedZVertical, toQueue: NSOperationQueue.currentQueue(), withHandler: {
                deviceManager, error in
                
                })
        }
    }
    
    func stopMotionManager() {
        if self.deviceMotionActive {
            self.stopDeviceMotionUpdates()
        }
    }
    
    func radiansToDegrees(#radians:CGFloat, correction:CGFloat) -> CGFloat {
        return (CGFloat(radians) * CGFloat(180.0 / M_PI) * correction)
    }
    
    func updatePosition(node: SKNode) {
        
        if let data = self.deviceMotion {
            
            let rollCorrection:CGFloat =  16.0
            let pitchCorrection:CGFloat = 12.0
            
            let forceX = self.radiansToDegrees(radians: CGFloat(-data.rotationRate.x), correction: rollCorrection)
            let forceY = self.radiansToDegrees(radians: CGFloat(-data.rotationRate.y), correction: pitchCorrection)
            
            node.physicsBody.applyForce(CGVectorMake(-0.2, -0.2))
            node.physicsBody.applyForce(CGVectorMake(forceX, forceY))
        }
    }
}