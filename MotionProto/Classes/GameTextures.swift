//
//  GameTextures.swift
//  MotionProto
//
//  Created by Jeremy Novak on 7/9/14.
//  Copyright (c) 2014 Jeremy Novak. All rights reserved.
//

import SpriteKit

let GameTexturesSharedInstance = GameTextures()

class GameTextures {
    class var sharedInstance:GameTextures {
        return GameTexturesSharedInstance
    }
    
    var textureAtlas = SKTextureAtlas()
    
    init() {
        textureAtlas = SKTextureAtlas(named: "artwork")
    }
}
