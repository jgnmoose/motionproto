//
//  Constants.swift
//  MotionProto
//
//  Created by Jeremy Novak on 7/3/14.
//  Copyright (c) 2014 Jeremy Novak. All rights reserved.
//

import CoreGraphics

let kDebug:Bool = true
var kFontName = "Silom-Bold"
var viewSize:CGSize!

// MARK: Game Layers
class GameLayer {
    class var Background:CGFloat    { return 0 }
    class var Game:CGFloat          { return 1 }
    class var Effects:CGFloat       { return 2 }
    class var Interface:CGFloat     { return 3 }
}

// MARK: Contact Categories
class Contact {
    class var Player:UInt32           { return 1 << 0 }
    class var PlayerMissile:UInt32    { return 1 << 1 }
    class var Alien:UInt32            { return 1 << 2 }
    class var AlienMissile:UInt32     { return 1 << 3 }
    class var AlienTorpedo:UInt32     { return 1 << 4 }
}