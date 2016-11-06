//
//  Gameplay.swift
//  Devil's Due
//
//  Created by Danny Perski on 9/7/16.
//  Copyright © 2016 Danny Perski. All rights reserved.
//

import Foundation
import UIKit

class Gameplay: UIViewController {
    
    //here is where I will define the tile types
    //0 : empty space
    //1 : walls
    //2 : edge walls
    //3 : doors
    //4 : stairs
    //5 : webs
    //6 : temp terrain object, will convert to various terrain objects
    //7 : hazard
    //8 : body
    //9 : candles
    //10 : fallen angel
    //11 : shrub
    //12 : weeds
    //13 : stockade
    //14 : pot
    
    //this array defines which objects cannot be moved onto
    var obs = [1,2,4,7,9,10,13,14]
    
    //this array will tell the game logic which objects can be interacted with when the player moves onto them
    var interactions = [3]
    
    //setting the player dimensions
    var pwidth:Int = 32
    var pheight:Int = 48
    var playerX:Int = 5
    var playerY:Int = 7
    var playerHealth:Int = 2
    
    //enemy coordinates
    var en1x:Int = 1
    var en1y:Int = 1
    //enemy stamina
    var en1s:Int = 10
    //enemy stamina temp
    var en1t:Int = 0
    //enemy health, used for death status
    var en1h:Int = 1
    
    //generic temp value
    var temp:Int = 0
    
    //value to count the pieces that need to spawn
    var pieces:Int = 0
    
    //current room
    var room:Int = 0
    
    //door coordinates
    var exitDoorX:Int = 0
    var exitDoorY:Int = 0
    var secretDoorX:Int = 0
    var secretDoorY:Int = 0
    
    //coordinates for entry staircase
    var stairsX:Int = 0
    var stairsY:Int = 0
    
    //setting the map size
    var boundsX:Int = 9
    var boundsY:Int = 8
    
    //enemy encounter boolean
    var moveEnabled:Bool = false
    
    //enemy encounter boolean
    var en1e:Bool = false
    //boolean to determine in an enemy is used in this room
    var en1u:Bool = false
    
    //player move permissions
    var canMoveUp:Bool = true
    var canMoveDown:Bool = true
    var canMoveLeft:Bool = true
    var canMoveRight:Bool = true
    
    //enemy move permissions
    var enemyCanMoveUp:Bool = true
    var enemyCanMoveDown:Bool = true
    var enemyCanMoveLeft:Bool = true
    var enemyCanMoveRight:Bool = true
    
    var enemyPriorityUp:Bool = false
    var enemyPriorityDown:Bool = false
    var enemyPriorityLeft:Bool = false
    var enemyPriorityRight:Bool = false
    
    var animationSpeed:Double = 0.25
    
    //these tell the game which pieces are physically occupied
    var a1o:Bool = false
    var a2o:Bool = false
    var a3o:Bool = false
    var a4o:Bool = false
    var a5o:Bool = false
    var a6o:Bool = false
    var a7o:Bool = false
    var a8o:Bool = false
    var a9o:Bool = false
    var b1o:Bool = false
    var b2o:Bool = false
    var b3o:Bool = false
    var b4o:Bool = false
    var b5o:Bool = false
    var b6o:Bool = false
    var b7o:Bool = false
    var b8o:Bool = false
    var b9o:Bool = false
    var c1o:Bool = false
    var c2o:Bool = false
    var c3o:Bool = false
    var c4o:Bool = false
    var c5o:Bool = false
    var c6o:Bool = false
    var c7o:Bool = false
    var c8o:Bool = false
    var c9o:Bool = false
    var d1o:Bool = false
    var d2o:Bool = false
    var d3o:Bool = false
    var d4o:Bool = false
    var d5o:Bool = false
    var d6o:Bool = false
    var d7o:Bool = false
    var d8o:Bool = false
    var d9o:Bool = false
    var e1o:Bool = false
    var e2o:Bool = false
    var e3o:Bool = false
    var e4o:Bool = false
    var e5o:Bool = false
    var e6o:Bool = false
    var e7o:Bool = false
    var e8o:Bool = false
    var e9o:Bool = false
    var f1o:Bool = false
    var f2o:Bool = false
    var f3o:Bool = false
    var f4o:Bool = false
    var f5o:Bool = false
    var f6o:Bool = false
    var f7o:Bool = false
    var f8o:Bool = false
    var f9o:Bool = false
    var g1o:Bool = false
    var g2o:Bool = false
    var g3o:Bool = false
    var g4o:Bool = false
    var g5o:Bool = false
    var g6o:Bool = false
    var g7o:Bool = false
    var g8o:Bool = false
    var g9o:Bool = false
    var h1o:Bool = false
    var h2o:Bool = false
    var h3o:Bool = false
    var h4o:Bool = false
    var h5o:Bool = false
    var h6o:Bool = false
    var h7o:Bool = false
    var h8o:Bool = false
    var h9o:Bool = false
    
    //these tell the game which pieces can be interacted with
    var a1x:Bool = false
    var a2x:Bool = false
    var a3x:Bool = false
    var a4x:Bool = false
    var a5x:Bool = false
    var a6x:Bool = false
    var a7x:Bool = false
    var a8x:Bool = false
    var a9x:Bool = false
    var b1x:Bool = false
    var b2x:Bool = false
    var b3x:Bool = false
    var b4x:Bool = false
    var b5x:Bool = false
    var b6x:Bool = false
    var b7x:Bool = false
    var b8x:Bool = false
    var b9x:Bool = false
    var c1x:Bool = false
    var c2x:Bool = false
    var c3x:Bool = false
    var c4x:Bool = false
    var c5x:Bool = false
    var c6x:Bool = false
    var c7x:Bool = false
    var c8x:Bool = false
    var c9x:Bool = false
    var d1x:Bool = false
    var d2x:Bool = false
    var d3x:Bool = false
    var d4x:Bool = false
    var d5x:Bool = false
    var d6x:Bool = false
    var d7x:Bool = false
    var d8x:Bool = false
    var d9x:Bool = false
    var e1x:Bool = false
    var e2x:Bool = false
    var e3x:Bool = false
    var e4x:Bool = false
    var e5x:Bool = false
    var e6x:Bool = false
    var e7x:Bool = false
    var e8x:Bool = false
    var e9x:Bool = false
    var f1x:Bool = false
    var f2x:Bool = false
    var f3x:Bool = false
    var f4x:Bool = false
    var f5x:Bool = false
    var f6x:Bool = false
    var f7x:Bool = false
    var f8x:Bool = false
    var f9x:Bool = false
    var g1x:Bool = false
    var g2x:Bool = false
    var g3x:Bool = false
    var g4x:Bool = false
    var g5x:Bool = false
    var g6x:Bool = false
    var g7x:Bool = false
    var g8x:Bool = false
    var g9x:Bool = false
    var h1x:Bool = false
    var h2x:Bool = false
    var h3x:Bool = false
    var h4x:Bool = false
    var h5x:Bool = false
    var h6x:Bool = false
    var h7x:Bool = false
    var h8x:Bool = false
    var h9x:Bool = false
    
    //these tell the game what kind of piece goes where
    var a1p:Int = 0
    var a2p:Int = 0
    var a3p:Int = 0
    var a4p:Int = 0
    var a5p:Int = 0
    var a6p:Int = 0
    var a7p:Int = 0
    var a8p:Int = 0
    var a9p:Int = 0
    var b1p:Int = 0
    var b2p:Int = 0
    var b3p:Int = 0
    var b4p:Int = 0
    var b5p:Int = 0
    var b6p:Int = 0
    var b7p:Int = 0
    var b8p:Int = 0
    var b9p:Int = 0
    var c1p:Int = 0
    var c2p:Int = 0
    var c3p:Int = 0
    var c4p:Int = 0
    var c5p:Int = 0
    var c6p:Int = 0
    var c7p:Int = 0
    var c8p:Int = 0
    var c9p:Int = 0
    var d1p:Int = 0
    var d2p:Int = 0
    var d3p:Int = 0
    var d4p:Int = 0
    var d5p:Int = 0
    var d6p:Int = 0
    var d7p:Int = 0
    var d8p:Int = 0
    var d9p:Int = 0
    var e1p:Int = 0
    var e2p:Int = 0
    var e3p:Int = 0
    var e4p:Int = 0
    var e5p:Int = 0
    var e6p:Int = 0
    var e7p:Int = 0
    var e8p:Int = 0
    var e9p:Int = 0
    var f1p:Int = 0
    var f2p:Int = 0
    var f3p:Int = 0
    var f4p:Int = 0
    var f5p:Int = 0
    var f6p:Int = 0
    var f7p:Int = 0
    var f8p:Int = 0
    var f9p:Int = 0
    var g1p:Int = 0
    var g2p:Int = 0
    var g3p:Int = 0
    var g4p:Int = 0
    var g5p:Int = 0
    var g6p:Int = 0
    var g7p:Int = 0
    var g8p:Int = 0
    var g9p:Int = 0
    var h1p:Int = 0
    var h2p:Int = 0
    var h3p:Int = 0
    var h4p:Int = 0
    var h5p:Int = 0
    var h6p:Int = 0
    var h7p:Int = 0
    var h8p:Int = 0
    var h9p:Int = 0
    
    //this is where player and enemy objects are defined
    @IBOutlet weak var player: UIImageView!
    
    @IBOutlet weak var en1i: UIImageView!
    
    //this is where the standard 72 tiles are defined
    @IBOutlet weak var a1i: UIImageView!
    @IBOutlet weak var a2i: UIImageView!
    @IBOutlet weak var a3i: UIImageView!
    @IBOutlet weak var a4i: UIImageView!
    @IBOutlet weak var a5i: UIImageView!
    @IBOutlet weak var a6i: UIImageView!
    @IBOutlet weak var a7i: UIImageView!
    @IBOutlet weak var a8i: UIImageView!
    @IBOutlet weak var a9i: UIImageView!
    @IBOutlet weak var b1i: UIImageView!
    @IBOutlet weak var b2i: UIImageView!
    @IBOutlet weak var b3i: UIImageView!
    @IBOutlet weak var b4i: UIImageView!
    @IBOutlet weak var b5i: UIImageView!
    @IBOutlet weak var b6i: UIImageView!
    @IBOutlet weak var b7i: UIImageView!
    @IBOutlet weak var b8i: UIImageView!
    @IBOutlet weak var b9i: UIImageView!
    @IBOutlet weak var c1i: UIImageView!
    @IBOutlet weak var c2i: UIImageView!
    @IBOutlet weak var c3i: UIImageView!
    @IBOutlet weak var c4i: UIImageView!
    @IBOutlet weak var c5i: UIImageView!
    @IBOutlet weak var c6i: UIImageView!
    @IBOutlet weak var c7i: UIImageView!
    @IBOutlet weak var c8i: UIImageView!
    @IBOutlet weak var c9i: UIImageView!
    @IBOutlet weak var d1i: UIImageView!
    @IBOutlet weak var d2i: UIImageView!
    @IBOutlet weak var d3i: UIImageView!
    @IBOutlet weak var d4i: UIImageView!
    @IBOutlet weak var d5i: UIImageView!
    @IBOutlet weak var d6i: UIImageView!
    @IBOutlet weak var d7i: UIImageView!
    @IBOutlet weak var d8i: UIImageView!
    @IBOutlet weak var d9i: UIImageView!
    @IBOutlet weak var e1i: UIImageView!
    @IBOutlet weak var e2i: UIImageView!
    @IBOutlet weak var e3i: UIImageView!
    @IBOutlet weak var e4i: UIImageView!
    @IBOutlet weak var e5i: UIImageView!
    @IBOutlet weak var e6i: UIImageView!
    @IBOutlet weak var e7i: UIImageView!
    @IBOutlet weak var e8i: UIImageView!
    @IBOutlet weak var e9i: UIImageView!
    @IBOutlet weak var f1i: UIImageView!
    @IBOutlet weak var f2i: UIImageView!
    @IBOutlet weak var f3i: UIImageView!
    @IBOutlet weak var f4i: UIImageView!
    @IBOutlet weak var f5i: UIImageView!
    @IBOutlet weak var f6i: UIImageView!
    @IBOutlet weak var f7i: UIImageView!
    @IBOutlet weak var f8i: UIImageView!
    @IBOutlet weak var f9i: UIImageView!
    @IBOutlet weak var g1i: UIImageView!
    @IBOutlet weak var g2i: UIImageView!
    @IBOutlet weak var g3i: UIImageView!
    @IBOutlet weak var g4i: UIImageView!
    @IBOutlet weak var g5i: UIImageView!
    @IBOutlet weak var g6i: UIImageView!
    @IBOutlet weak var g7i: UIImageView!
    @IBOutlet weak var g8i: UIImageView!
    @IBOutlet weak var g9i: UIImageView!
    @IBOutlet weak var h1i: UIImageView!
    @IBOutlet weak var h2i: UIImageView!
    @IBOutlet weak var h3i: UIImageView!
    @IBOutlet weak var h4i: UIImageView!
    @IBOutlet weak var h5i: UIImageView!
    @IBOutlet weak var h6i: UIImageView!
    @IBOutlet weak var h7i: UIImageView!
    @IBOutlet weak var h8i: UIImageView!
    @IBOutlet weak var h9i: UIImageView!
    
    @IBOutlet weak var gridView: UIView!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var endView: UIView!
    
    @IBOutlet weak var relicView: UIView!
    @IBOutlet weak var relicPreview: UIImageView!
    @IBOutlet weak var relicText: UITextView!
    
    @IBOutlet weak var messageText: UITextView!
    @IBOutlet weak var endText: UITextView!
    
    @IBOutlet weak var tileImage: UIImage!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var embarkLabel: UILabel!
    @IBOutlet weak var hsLabel: UILabel!
    @IBOutlet weak var musicToggleLabel: UILabel!
    @IBOutlet weak var needHelpLabel: UILabel!
    
    //this method is called when you press embark on the main menu
    @IBAction func embark(_ sender: AnyObject) {
        UIView.animate(withDuration: animationSpeed, animations: {
            self.titleView.alpha = 0
        }) 
        self.moveEnabled = true
    }
    
    @IBAction func dismissMessage(_ sender: AnyObject) {
        moveEnabled = true
        UIView.animate(withDuration: animationSpeed, animations: {
            self.messageView.alpha = 0
        }) 
    }
    
    @IBAction func dismissRelic(_ sender: AnyObject) {
        moveEnabled = true
        UIView.animate(withDuration: animationSpeed, animations: {
            self.relicView.alpha = 0
        }) 
    }
    
    @IBAction func dismissEnd(_ sender: AnyObject) {
        UIView.animate(withDuration: animationSpeed, animations: {
            self.endView.alpha = 0
            self.titleView.alpha = 1
        }) 
        
        restart()
    }
    
    func endTurn() {
        if (playerX == exitDoorX && playerY == exitDoorY) {
            room = room + 1
            generateNew()
        }
        else {
            //only check this code
            if (en1h > 0) {
                checkEnemyConstraints()
                checkEnemyEncounter()
                
                //checks if you are encountering the enemy or not
                if (en1e == false && en1u == true) {
                    temp = 1
                    en1t = en1t + 1
                    if (en1t <= en1s) {
                        while (temp > 0) {
                            moveEnemy()
                        }
                    }
                    else {
                        en1t = 0
                    }
                }
                
                en1e = false
            }
        }
        
        checkEnemyPriority()
    }
    
    func restart() {
        self.player.image = UIImage(named: "hero-1.png")
        playerHealth = 2
        room = 0
        pieces = 0
        
        enemyPriorityUp = false
        enemyPriorityDown = false
        enemyPriorityLeft = false
        enemyPriorityRight = false
        
        generateNew()
    }
    
    func generateNew() {
        reset()
        
        if (room == 0) {
            a1p = 1
            a2p = 1
            a3p = 1
            a4p = 2
            a5p = 2
            a6p = 2
            a7p = 1
            a8p = 1
            a9p = 1
            b1p = 1
            b2p = 2
            b3p = 2
            b7p = 1
            b8p = 1
            b9p = 1
            c1p = 1
            c7p = 2
            c8p = 2
            c9p = 1
            d1p = 1
            d9p = 1
            e1p = 1
            e9p = 1
            f1p = 2
            f9p = 2
            g1p = 7
            g2p = 7
            g3p = 7
            g4p = 7
            g5p = 7
            g6p = 7
            g7p = 7
            g8p = 7
            g9p = 7
            h1p = 7
            h2p = 7
            h3p = 7
            h4p = 7
            h5p = 7
            h6p = 7
            h7p = 7
            h8p = 7
            h9p = 7
            
            newDoor()
            //newStairs()
            self.player.center = CGPoint(x: self.e5i.center.x, y: self.e5i.center.y)
            playerY = 5
            playerX = 5
        }
        else {
            //this random will let the game choose a new room layout each time
            let prereq = arc4random() % 9
            if (prereq == 0) {
                a1p = 1
                a2p = 2
                a3p = 2
                a4p = 2
                a5p = 2
                a6p = 2
                a7p = 2
                a8p = 2
                a9p = 1
                b1p = 1
                b9p = 1
                c1p = 1
                c9p = 1
                d1p = 1
                d9p = 1
                e1p = 1
                e9p = 1
                f1p = 1
                f9p = 1
                g1p = 1
                g9p = 1
                h1p = 2
                h2p = 2
                h3p = 2
                h4p = 2
                h5p = 2
                h6p = 2
                h7p = 2
                h8p = 2
                h9p = 2
                
                newWebs()
                newDoor()
                newStairs()
            }
            
            if (prereq == 1) {
                a1p = 1
                a2p = 2
                a3p = 2
                a4p = 2
                a5p = 2
                a6p = 2
                a7p = 2
                a8p = 2
                a9p = 1
                b1p = 1
                b9p = 1
                c1p = 1
                c9p = 1
                d1p = 1
                d4p = 1
                d5p = 1
                d6p = 1
                d9p = 1
                e1p = 1
                e4p = 2
                e5p = 2
                e6p = 2
                e9p = 1
                f1p = 1
                f9p = 1
                g1p = 1
                g9p = 1
                h1p = 2
                h2p = 2
                h3p = 2
                h4p = 2
                h5p = 2
                h6p = 2
                h7p = 2
                h8p = 2
                h9p = 2
                
                newWebs()
                newDoor()
                newStairs()
            }
            
            if (prereq == 2) {
                a1p = 1
                a2p = 2
                a3p = 2
                a4p = 2
                a5p = 2
                a6p = 2
                a7p = 2
                a8p = 2
                a9p = 1
                b1p = 1
                b9p = 1
                c1p = 1
                c5p = 1
                c9p = 1
                d1p = 1
                d5p = 1
                d9p = 1
                e1p = 1
                e5p = 1
                e9p = 1
                f1p = 1
                f5p = 2
                f9p = 1
                g1p = 1
                g9p = 1
                h1p = 2
                h2p = 2
                h3p = 2
                h4p = 2
                h5p = 2
                h6p = 2
                h7p = 2
                h8p = 2
                h9p = 2
                
                newWebs()
                newDoor()
                newStairs()
            }
            
            if (prereq == 3) {
                a1p = 1
                a2p = 2
                a3p = 2
                a4p = 2
                a5p = 2
                a6p = 2
                a7p = 2
                a8p = 2
                a9p = 1
                b1p = 1
                b9p = 1
                c1p = 1
                c9p = 1
                d1p = 1
                d2p = 1
                d3p = 1
                d4p = 1
                d5p = 1
                d9p = 1
                e1p = 1
                e2p = 2
                e3p = 2
                e4p = 2
                e5p = 2
                e9p = 1
                f1p = 1
                f9p = 1
                g1p = 1
                g9p = 1
                h1p = 2
                h2p = 2
                h3p = 2
                h4p = 2
                h5p = 2
                h6p = 2
                h7p = 2
                h8p = 2
                h9p = 2
                
                newWebs()
                newDoor()
                newStairs()
            }
            
            if (prereq == 4) {
                a1p = 1
                a2p = 2
                a3p = 2
                a4p = 2
                a5p = 2
                a6p = 2
                a7p = 2
                a8p = 2
                a9p = 1
                b1p = 1
                b9p = 1
                c1p = 1
                c8p = 6
                c9p = 1
                d1p = 1
                d5p = 1
                d6p = 1
                d7p = 1
                d8p = 1
                d9p = 1
                e1p = 1
                e5p = 2
                e6p = 2
                e7p = 2
                e8p = 2
                e9p = 1
                f1p = 1
                c8p = 6
                f9p = 1
                g1p = 1
                g9p = 1
                h1p = 2
                h2p = 2
                h3p = 2
                h4p = 2
                h5p = 2
                h6p = 2
                h7p = 2
                h8p = 2
                h9p = 2
                
                newWebs()
                newDoor()
                newStairs()
            }
            
            if (prereq == 5) {
                a1p = 1
                a2p = 2
                a3p = 2
                a4p = 2
                a5p = 2
                a6p = 2
                a7p = 2
                a8p = 2
                a9p = 1
                b1p = 1
                b9p = 1
                c1p = 1
                c9p = 1
                d1p = 1
                d5p = 1
                d6p = 7
                d7p = 7
                d8p = 7
                d9p = 1
                e1p = 1
                e5p = 2
                e6p = 7
                e7p = 7
                e8p = 7
                e9p = 1
                f1p = 1
                f9p = 1
                g1p = 1
                g9p = 1
                h1p = 2
                h2p = 2
                h3p = 2
                h4p = 2
                h5p = 2
                h6p = 2
                h7p = 2
                h8p = 2
                h9p = 2
                
                newWebs()
                newDoor()
                newStairs()
            }
            
            if (prereq == 6) {
                a1p = 1
                a2p = 2
                a3p = 2
                a4p = 2
                a5p = 2
                a6p = 2
                a7p = 2
                a8p = 2
                a9p = 1
                b1p = 1
                b9p = 1
                c1p = 1
                c9p = 1
                d1p = 1
                d2p = 7
                d3p = 7
                d4p = 7
                d5p = 1
                d9p = 1
                e1p = 1
                e2p = 7
                e3p = 7
                e4p = 7
                e5p = 2
                e9p = 1
                f1p = 1
                f9p = 1
                g1p = 1
                g9p = 1
                h1p = 2
                h2p = 2
                h3p = 2
                h4p = 2
                h5p = 2
                h6p = 2
                h7p = 2
                h8p = 2
                h9p = 2
                
                newWebs()
                newDoor()
                newStairs()
            }
            
            if (prereq == 7) {
                a1p = 1
                a2p = 2
                a3p = 2
                a4p = 2
                a5p = 2
                a6p = 2
                a7p = 2
                a8p = 2
                a9p = 1
                b1p = 1
                b9p = 1
                c1p = 1
                c9p = 1
                d1p = 1
                d3p = 1
                d4p = 7
                d5p = 7
                d6p = 7
                d7p = 1
                d9p = 1
                e1p = 1
                e3p = 2
                e4p = 7
                e5p = 7
                e6p = 7
                e7p = 2
                e9p = 1
                f1p = 1
                f9p = 1
                g1p = 1
                g9p = 1
                h1p = 2
                h2p = 2
                h3p = 2
                h4p = 2
                h5p = 2
                h6p = 2
                h7p = 2
                h8p = 2
                h9p = 2
                
                newWebs()
                newDoor()
                newStairs()
            }
            
            if (prereq == 8) {
                a1p = 1
                a2p = 2
                a3p = 2
                a4p = 2
                a5p = 2
                a6p = 2
                a7p = 2
                a8p = 2
                a9p = 1
                b1p = 1
                b9p = 1
                c1p = 1
                c9p = 1
                d1p = 1
                d2p = 7
                d3p = 1
                d7p = 1
                d8p = 7
                d9p = 1
                e1p = 1
                e2p = 7
                e3p = 2
                e7p = 2
                e8p = 7
                e9p = 1
                f1p = 1
                f9p = 1
                g1p = 1
                g9p = 1
                h1p = 2
                h2p = 2
                h3p = 2
                h4p = 2
                h5p = 2
                h6p = 2
                h7p = 2
                h8p = 2
                h9p = 2
                
                newWebs()
                newDoor()
                newStairs()
            }
            
            pieces = 1
        }
        
        checkObstacles()
        
        if (pieces < 1) {
            en1i.isHidden = true
            en1u = false
        }
        else {
            en1i.isHidden = false
            en1u = true
        }
        while (pieces > 0) {
            spawnEnemies()
        }
        
        loadSprites()
    }
    
    @IBAction func debug(_ sender: AnyObject) {
        print("moveEnabled: ", moveEnabled)
    }
    
    func spawnEnemies() {
        let column = arc4random() % 9
        let row = arc4random() % 8
        
        en1h = 1
        en1i.alpha = 1
        
        //this code determines what kind of enemy will spawn
        let tempspec = arc4random() % 6
        if (tempspec == 0) {
            self.en1i.image = UIImage(named: "cobra-1.png")
        }
        else if (tempspec == 1) {
            self.en1i.image = UIImage(named: "skeleton.png")
        }
        else if (tempspec == 2) {
            self.en1i.image = UIImage(named: "flare.png")
        }
        else if (tempspec == 3) {
            self.en1i.image = UIImage(named: "werewolf.png")
        }
        else if (tempspec == 4) {
            self.en1i.image = UIImage(named: "spider.png")
        }
        else if (tempspec == 5) {
            self.en1i.image = UIImage(named: "leech.png")
        }
        else if (tempspec == 6) {
            self.en1i.image = UIImage(named: "husk.png")
        }
        else if (tempspec == 7) {
            self.en1i.image = UIImage(named: "wraith.png")
        }
        else if (tempspec == 8) {
            self.en1i.image = UIImage(named: "pyromancer.png")
        }
        else if (tempspec == 9) {
            self.en1i.image = UIImage(named: "sorceress.png")
        }
        else if (tempspec == 10) {
            self.en1i.image = UIImage(named: "giant.png")
        }
        else if (tempspec == 11) {
            self.en1i.image = UIImage(named: "necromancer.png")
        }
        
        //this code can use the temp values column and row used to spawn the enemy to also determine it's proprietary coordinates
        let myXValue:Int = Int(column)
        en1x = (myXValue) + 1
        let myYValue:Int = Int(row)
        en1y = (myYValue) + 1
        
        //we need to make sure the enemy does not spawn right next to the player
        if (en1x != playerX && en1y != playerY) {
            if (row == 0) {
                if (column == 0) {
                    if (a1p == 0) {
                        self.en1i.center = CGPoint(x: self.a1i.center.x, y: self.a1i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 1) {
                    if (a2p == 0) {
                        self.en1i.center = CGPoint(x: self.a2i.center.x, y: self.a2i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 2) {
                    if (a3p == 0) {
                        self.en1i.center = CGPoint(x: self.a3i.center.x, y: self.a3i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 3) {
                    if (a4p == 0) {
                        self.en1i.center = CGPoint(x: self.a4i.center.x, y: self.a4i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 4) {
                    if (a5p == 0) {
                        self.en1i.center = CGPoint(x: self.a5i.center.x, y: self.a5i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 5) {
                    if (a6p == 0) {
                        self.en1i.center = CGPoint(x: self.a6i.center.x, y: self.a6i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 6) {
                    if (a7p == 0) {
                        self.en1i.center = CGPoint(x: self.a7i.center.x, y: self.a7i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 7) {
                    if (a8p == 0) {
                        self.en1i.center = CGPoint(x: self.a8i.center.x, y: self.a8i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 8) {
                    if (a9p == 0) {
                        self.en1i.center = CGPoint(x: self.a9i.center.x, y: self.a9i.center.y)
                        pieces = pieces - 1
                    }
                }
            }
            if (row == 1) {
                if (column == 0) {
                    if (b1p == 0) {
                        self.en1i.center = CGPoint(x: self.b1i.center.x, y: self.b1i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 1) {
                    if (b2p == 0) {
                        self.en1i.center = CGPoint(x: self.b2i.center.x, y: self.b2i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 2) {
                    if (b3p == 0) {
                        self.en1i.center = CGPoint(x: self.b3i.center.x, y: self.b3i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 3) {
                    if (b4p == 0) {
                        self.en1i.center = CGPoint(x: self.b4i.center.x, y: self.b4i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 4) {
                    if (b5p == 0) {
                        self.en1i.center = CGPoint(x: self.b5i.center.x, y: self.b5i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 5) {
                    if (b6p == 0) {
                        self.en1i.center = CGPoint(x: self.b6i.center.x, y: self.b6i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 6) {
                    if (b7p == 0) {
                        self.en1i.center = CGPoint(x: self.b7i.center.x, y: self.b7i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 7) {
                    if (b8p == 0) {
                        self.en1i.center = CGPoint(x: self.b8i.center.x, y: self.b8i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 8) {
                    if (b9p == 0) {
                        self.en1i.center = CGPoint(x: self.b9i.center.x, y: self.b9i.center.y)
                        pieces = pieces - 1
                    }
                }
            }
            if (row == 2) {
                if (column == 0) {
                    if (c1p == 0) {
                        self.en1i.center = CGPoint(x: self.c1i.center.x, y: self.c1i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 1) {
                    if (c2p == 0) {
                        self.en1i.center = CGPoint(x: self.c2i.center.x, y: self.c2i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 2) {
                    if (c3p == 0) {
                        self.en1i.center = CGPoint(x: self.c3i.center.x, y: self.c3i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 3) {
                    if (c4p == 0) {
                        self.en1i.center = CGPoint(x: self.c4i.center.x, y: self.c4i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 4) {
                    if (c5p == 0) {
                        self.en1i.center = CGPoint(x: self.c5i.center.x, y: self.c5i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 5) {
                    if (c6p == 0) {
                        self.en1i.center = CGPoint(x: self.c6i.center.x, y: self.c6i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 6) {
                    if (c7p == 0) {
                        self.en1i.center = CGPoint(x: self.c7i.center.x, y: self.c7i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 7) {
                    if (c8p == 0) {
                        self.en1i.center = CGPoint(x: self.c8i.center.x, y: self.c8i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 8) {
                    if (c9p == 0) {
                        self.en1i.center = CGPoint(x: self.c9i.center.x, y: self.c9i.center.y)
                        pieces = pieces - 1
                    }
                }
            }
            if (row == 3) {
                if (column == 0) {
                    if (d1p == 0) {
                        self.en1i.center = CGPoint(x: self.d1i.center.x, y: self.d1i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 1) {
                    if (d2p == 0) {
                        self.en1i.center = CGPoint(x: self.d2i.center.x, y: self.d2i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 2) {
                    if (d3p == 0) {
                        self.en1i.center = CGPoint(x: self.d3i.center.x, y: self.d3i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 3) {
                    if (d4p == 0) {
                        self.en1i.center = CGPoint(x: self.d4i.center.x, y: self.d4i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 4) {
                    if (d5p == 0) {
                        self.en1i.center = CGPoint(x: self.d5i.center.x, y: self.d5i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 5) {
                    if (d6p == 0) {
                        self.en1i.center = CGPoint(x: self.d6i.center.x, y: self.d6i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 6) {
                    if (d7p == 0) {
                        self.en1i.center = CGPoint(x: self.d7i.center.x, y: self.d7i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 7) {
                    if (d8p == 0) {
                        self.en1i.center = CGPoint(x: self.d8i.center.x, y: self.d8i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 8) {
                    if (d9p == 0) {
                        self.en1i.center = CGPoint(x: self.d9i.center.x, y: self.d9i.center.y)
                        pieces = pieces - 1
                    }
                }
            }
            if (row == 4) {
                if (column == 0) {
                    if (e1p == 0) {
                        self.en1i.center = CGPoint(x: self.e1i.center.x, y: self.e1i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 1) {
                    if (e2p == 0) {
                        self.en1i.center = CGPoint(x: self.e2i.center.x, y: self.e2i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 2) {
                    if (e3p == 0) {
                        self.en1i.center = CGPoint(x: self.e3i.center.x, y: self.e3i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 3) {
                    if (e4p == 0) {
                        self.en1i.center = CGPoint(x: self.e4i.center.x, y: self.e4i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 4) {
                    if (e5p == 0) {
                        self.en1i.center = CGPoint(x: self.e5i.center.x, y: self.e5i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 5) {
                    if (e6p == 0) {
                        self.en1i.center = CGPoint(x: self.e6i.center.x, y: self.e6i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 6) {
                    if (e7p == 0) {
                        self.en1i.center = CGPoint(x: self.e7i.center.x, y: self.e7i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 7) {
                    if (e8p == 0) {
                        self.en1i.center = CGPoint(x: self.e8i.center.x, y: self.e8i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 8) {
                    if (e9p == 0) {
                        self.en1i.center = CGPoint(x: self.e9i.center.x, y: self.e9i.center.y)
                        pieces = pieces - 1
                    }
                }
            }
            if (row == 5) {
                if (column == 0) {
                    if (f1p == 0) {
                        self.en1i.center = CGPoint(x: self.f1i.center.x, y: self.f1i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 1) {
                    if (f2p == 0) {
                        self.en1i.center = CGPoint(x: self.f2i.center.x, y: self.f2i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 2) {
                    if (f3p == 0) {
                        self.en1i.center = CGPoint(x: self.f3i.center.x, y: self.f3i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 3) {
                    if (f4p == 0) {
                        self.en1i.center = CGPoint(x: self.f4i.center.x, y: self.f4i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 4) {
                    if (f5p == 0) {
                        self.en1i.center = CGPoint(x: self.f5i.center.x, y: self.f5i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 5) {
                    if (f6p == 0) {
                        self.en1i.center = CGPoint(x: self.f6i.center.x, y: self.f6i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 6) {
                    if (f7p == 0) {
                        self.en1i.center = CGPoint(x: self.f7i.center.x, y: self.f7i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 7) {
                    if (f8p == 0) {
                        self.en1i.center = CGPoint(x: self.f8i.center.x, y: self.f8i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 8) {
                    if (f9p == 0) {
                        self.en1i.center = CGPoint(x: self.f9i.center.x, y: self.f9i.center.y)
                        pieces = pieces - 1
                    }
                }
            }
            if (row == 6) {
                if (column == 0) {
                    if (g1p == 0) {
                        self.en1i.center = CGPoint(x: self.g1i.center.x, y: self.g1i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 1) {
                    if (g2p == 0) {
                        self.en1i.center = CGPoint(x: self.g2i.center.x, y: self.g2i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 2) {
                    if (g3p == 0) {
                        self.en1i.center = CGPoint(x: self.g3i.center.x, y: self.g3i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 3) {
                    if (g4p == 0) {
                        self.en1i.center = CGPoint(x: self.g4i.center.x, y: self.g4i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 4) {
                    if (g5p == 0) {
                        self.en1i.center = CGPoint(x: self.g5i.center.x, y: self.g5i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 5) {
                    if (g6p == 0) {
                        self.en1i.center = CGPoint(x: self.g6i.center.x, y: self.g6i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 6) {
                    if (g7p == 0) {
                        self.en1i.center = CGPoint(x: self.g7i.center.x, y: self.g7i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 7) {
                    if (g8p == 0) {
                        self.en1i.center = CGPoint(x: self.g8i.center.x, y: self.g8i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 8) {
                    if (g9p == 0) {
                        self.en1i.center = CGPoint(x: self.g9i.center.x, y: self.g9i.center.y)
                        pieces = pieces - 1
                    }
                }
            }
            if (row == 7) {
                if (column == 0) {
                    if (h1p == 0) {
                        self.en1i.center = CGPoint(x: self.h1i.center.x, y: self.h1i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 1) {
                    if (h2p == 0) {
                        self.en1i.center = CGPoint(x: self.h2i.center.x, y: self.h2i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 2) {
                    if (h3p == 0) {
                        self.en1i.center = CGPoint(x: self.h3i.center.x, y: self.h3i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 3) {
                    if (h4p == 0) {
                        self.en1i.center = CGPoint(x: self.h4i.center.x, y: self.h4i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 4) {
                    if (h5p == 0) {
                        self.en1i.center = CGPoint(x: self.h5i.center.x, y: self.h5i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 5) {
                    if (h6p == 0) {
                        self.en1i.center = CGPoint(x: self.h6i.center.x, y: self.h6i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 6) {
                    if (h7p == 0) {
                        self.en1i.center = CGPoint(x: self.h7i.center.x, y: self.h7i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 7) {
                    if (h8p == 0) {
                        self.en1i.center = CGPoint(x: self.h8i.center.x, y: self.h8i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 8) {
                    if (h9p == 0) {
                        self.en1i.center = CGPoint(x: self.h9i.center.x, y: self.h9i.center.y)
                        pieces = pieces - 1
                    }
                }
            }
        }
    }
    
    func spawnFoliage() {
        let column = arc4random() % 9
        let row = arc4random() % 8
        
        //this code determines what kind of foliage will spawn
        
        
        //we need to make sure the foliage does not spawn right next to the player
        if (en1x != playerX && en1y != playerY) {
            if (row == 0) {
                if (column == 0) {
                    if (a1p == 0) {
                        self.en1i.center = CGPoint(x: self.a1i.center.x, y: self.a1i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 1) {
                    if (a2p == 0) {
                        self.en1i.center = CGPoint(x: self.a2i.center.x, y: self.a2i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 2) {
                    if (a3p == 0) {
                        self.en1i.center = CGPoint(x: self.a3i.center.x, y: self.a3i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 3) {
                    if (a4p == 0) {
                        self.en1i.center = CGPoint(x: self.a4i.center.x, y: self.a4i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 4) {
                    if (a5p == 0) {
                        self.en1i.center = CGPoint(x: self.a5i.center.x, y: self.a5i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 5) {
                    if (a6p == 0) {
                        self.en1i.center = CGPoint(x: self.a6i.center.x, y: self.a6i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 6) {
                    if (a7p == 0) {
                        self.en1i.center = CGPoint(x: self.a7i.center.x, y: self.a7i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 7) {
                    if (a8p == 0) {
                        self.en1i.center = CGPoint(x: self.a8i.center.x, y: self.a8i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 8) {
                    if (a9p == 0) {
                        self.en1i.center = CGPoint(x: self.a9i.center.x, y: self.a9i.center.y)
                        pieces = pieces - 1
                    }
                }
            }
            if (row == 1) {
                if (column == 0) {
                    if (b1p == 0) {
                        self.en1i.center = CGPoint(x: self.b1i.center.x, y: self.b1i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 1) {
                    if (b2p == 0) {
                        self.en1i.center = CGPoint(x: self.b2i.center.x, y: self.b2i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 2) {
                    if (b3p == 0) {
                        self.en1i.center = CGPoint(x: self.b3i.center.x, y: self.b3i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 3) {
                    if (b4p == 0) {
                        self.en1i.center = CGPoint(x: self.b4i.center.x, y: self.b4i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 4) {
                    if (b5p == 0) {
                        self.en1i.center = CGPoint(x: self.b5i.center.x, y: self.b5i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 5) {
                    if (b6p == 0) {
                        self.en1i.center = CGPoint(x: self.b6i.center.x, y: self.b6i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 6) {
                    if (b7p == 0) {
                        self.en1i.center = CGPoint(x: self.b7i.center.x, y: self.b7i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 7) {
                    if (b8p == 0) {
                        self.en1i.center = CGPoint(x: self.b8i.center.x, y: self.b8i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 8) {
                    if (b9p == 0) {
                        self.en1i.center = CGPoint(x: self.b9i.center.x, y: self.b9i.center.y)
                        pieces = pieces - 1
                    }
                }
            }
            if (row == 2) {
                if (column == 0) {
                    if (c1p == 0) {
                        self.en1i.center = CGPoint(x: self.c1i.center.x, y: self.c1i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 1) {
                    if (c2p == 0) {
                        self.en1i.center = CGPoint(x: self.c2i.center.x, y: self.c2i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 2) {
                    if (c3p == 0) {
                        self.en1i.center = CGPoint(x: self.c3i.center.x, y: self.c3i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 3) {
                    if (c4p == 0) {
                        self.en1i.center = CGPoint(x: self.c4i.center.x, y: self.c4i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 4) {
                    if (c5p == 0) {
                        self.en1i.center = CGPoint(x: self.c5i.center.x, y: self.c5i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 5) {
                    if (c6p == 0) {
                        self.en1i.center = CGPoint(x: self.c6i.center.x, y: self.c6i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 6) {
                    if (c7p == 0) {
                        self.en1i.center = CGPoint(x: self.c7i.center.x, y: self.c7i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 7) {
                    if (c8p == 0) {
                        self.en1i.center = CGPoint(x: self.c8i.center.x, y: self.c8i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 8) {
                    if (c9p == 0) {
                        self.en1i.center = CGPoint(x: self.c9i.center.x, y: self.c9i.center.y)
                        pieces = pieces - 1
                    }
                }
            }
            if (row == 3) {
                if (column == 0) {
                    if (d1p == 0) {
                        self.en1i.center = CGPoint(x: self.d1i.center.x, y: self.d1i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 1) {
                    if (d2p == 0) {
                        self.en1i.center = CGPoint(x: self.d2i.center.x, y: self.d2i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 2) {
                    if (d3p == 0) {
                        self.en1i.center = CGPoint(x: self.d3i.center.x, y: self.d3i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 3) {
                    if (d4p == 0) {
                        self.en1i.center = CGPoint(x: self.d4i.center.x, y: self.d4i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 4) {
                    if (d5p == 0) {
                        self.en1i.center = CGPoint(x: self.d5i.center.x, y: self.d5i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 5) {
                    if (d6p == 0) {
                        self.en1i.center = CGPoint(x: self.d6i.center.x, y: self.d6i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 6) {
                    if (d7p == 0) {
                        self.en1i.center = CGPoint(x: self.d7i.center.x, y: self.d7i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 7) {
                    if (d8p == 0) {
                        self.en1i.center = CGPoint(x: self.d8i.center.x, y: self.d8i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 8) {
                    if (d9p == 0) {
                        self.en1i.center = CGPoint(x: self.d9i.center.x, y: self.d9i.center.y)
                        pieces = pieces - 1
                    }
                }
            }
            if (row == 4) {
                if (column == 0) {
                    if (e1p == 0) {
                        self.en1i.center = CGPoint(x: self.e1i.center.x, y: self.e1i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 1) {
                    if (e2p == 0) {
                        self.en1i.center = CGPoint(x: self.e2i.center.x, y: self.e2i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 2) {
                    if (e3p == 0) {
                        self.en1i.center = CGPoint(x: self.e3i.center.x, y: self.e3i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 3) {
                    if (e4p == 0) {
                        self.en1i.center = CGPoint(x: self.e4i.center.x, y: self.e4i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 4) {
                    if (e5p == 0) {
                        self.en1i.center = CGPoint(x: self.e5i.center.x, y: self.e5i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 5) {
                    if (e6p == 0) {
                        self.en1i.center = CGPoint(x: self.e6i.center.x, y: self.e6i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 6) {
                    if (e7p == 0) {
                        self.en1i.center = CGPoint(x: self.e7i.center.x, y: self.e7i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 7) {
                    if (e8p == 0) {
                        self.en1i.center = CGPoint(x: self.e8i.center.x, y: self.e8i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 8) {
                    if (e9p == 0) {
                        self.en1i.center = CGPoint(x: self.e9i.center.x, y: self.e9i.center.y)
                        pieces = pieces - 1
                    }
                }
            }
            if (row == 5) {
                if (column == 0) {
                    if (f1p == 0) {
                        self.en1i.center = CGPoint(x: self.f1i.center.x, y: self.f1i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 1) {
                    if (f2p == 0) {
                        self.en1i.center = CGPoint(x: self.f2i.center.x, y: self.f2i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 2) {
                    if (f3p == 0) {
                        self.en1i.center = CGPoint(x: self.f3i.center.x, y: self.f3i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 3) {
                    if (f4p == 0) {
                        self.en1i.center = CGPoint(x: self.f4i.center.x, y: self.f4i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 4) {
                    if (f5p == 0) {
                        self.en1i.center = CGPoint(x: self.f5i.center.x, y: self.f5i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 5) {
                    if (f6p == 0) {
                        self.en1i.center = CGPoint(x: self.f6i.center.x, y: self.f6i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 6) {
                    if (f7p == 0) {
                        self.en1i.center = CGPoint(x: self.f7i.center.x, y: self.f7i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 7) {
                    if (f8p == 0) {
                        self.en1i.center = CGPoint(x: self.f8i.center.x, y: self.f8i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 8) {
                    if (f9p == 0) {
                        self.en1i.center = CGPoint(x: self.f9i.center.x, y: self.f9i.center.y)
                        pieces = pieces - 1
                    }
                }
            }
            if (row == 6) {
                if (column == 0) {
                    if (g1p == 0) {
                        self.en1i.center = CGPoint(x: self.g1i.center.x, y: self.g1i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 1) {
                    if (g2p == 0) {
                        self.en1i.center = CGPoint(x: self.g2i.center.x, y: self.g2i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 2) {
                    if (g3p == 0) {
                        self.en1i.center = CGPoint(x: self.g3i.center.x, y: self.g3i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 3) {
                    if (g4p == 0) {
                        self.en1i.center = CGPoint(x: self.g4i.center.x, y: self.g4i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 4) {
                    if (g5p == 0) {
                        self.en1i.center = CGPoint(x: self.g5i.center.x, y: self.g5i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 5) {
                    if (g6p == 0) {
                        self.en1i.center = CGPoint(x: self.g6i.center.x, y: self.g6i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 6) {
                    if (g7p == 0) {
                        self.en1i.center = CGPoint(x: self.g7i.center.x, y: self.g7i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 7) {
                    if (g8p == 0) {
                        self.en1i.center = CGPoint(x: self.g8i.center.x, y: self.g8i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 8) {
                    if (g9p == 0) {
                        self.en1i.center = CGPoint(x: self.g9i.center.x, y: self.g9i.center.y)
                        pieces = pieces - 1
                    }
                }
            }
            if (row == 7) {
                if (column == 0) {
                    if (h1p == 0) {
                        self.en1i.center = CGPoint(x: self.h1i.center.x, y: self.h1i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 1) {
                    if (h2p == 0) {
                        self.en1i.center = CGPoint(x: self.h2i.center.x, y: self.h2i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 2) {
                    if (h3p == 0) {
                        self.en1i.center = CGPoint(x: self.h3i.center.x, y: self.h3i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 3) {
                    if (h4p == 0) {
                        self.en1i.center = CGPoint(x: self.h4i.center.x, y: self.h4i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 4) {
                    if (h5p == 0) {
                        self.en1i.center = CGPoint(x: self.h5i.center.x, y: self.h5i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 5) {
                    if (h6p == 0) {
                        self.en1i.center = CGPoint(x: self.h6i.center.x, y: self.h6i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 6) {
                    if (h7p == 0) {
                        self.en1i.center = CGPoint(x: self.h7i.center.x, y: self.h7i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 7) {
                    if (h8p == 0) {
                        self.en1i.center = CGPoint(x: self.h8i.center.x, y: self.h8i.center.y)
                        pieces = pieces - 1
                    }
                }
                if (column == 8) {
                    if (h9p == 0) {
                        self.en1i.center = CGPoint(x: self.h9i.center.x, y: self.h9i.center.y)
                        pieces = pieces - 1
                    }
                }
            }
        }
    }
    
    func reset() {
        a1p = 0
        a2p = 0
        a3p = 0
        a4p = 0
        a5p = 0
        a6p = 0
        a7p = 0
        a8p = 0
        a9p = 0
        b1p = 0
        b2p = 0
        b3p = 0
        b4p = 0
        b5p = 0
        b6p = 0
        b7p = 0
        b8p = 0
        b9p = 0
        c1p = 0
        c2p = 0
        c3p = 0
        c4p = 0
        c5p = 0
        c6p = 0
        c7p = 0
        c8p = 0
        c9p = 0
        d1p = 0
        d2p = 0
        d3p = 0
        d4p = 0
        d5p = 0
        d6p = 0
        d7p = 0
        d8p = 0
        d9p = 0
        e1p = 0
        e2p = 0
        e3p = 0
        e4p = 0
        e5p = 0
        e6p = 0
        e7p = 0
        e8p = 0
        e9p = 0
        f1p = 0
        f2p = 0
        f3p = 0
        f4p = 0
        f5p = 0
        f6p = 0
        f7p = 0
        f8p = 0
        f9p = 0
        g1p = 0
        g2p = 0
        g3p = 0
        g4p = 0
        g5p = 0
        g6p = 0
        g7p = 0
        g8p = 0
        g9p = 0
        h1p = 0
        h2p = 0
        h3p = 0
        h4p = 0
        h5p = 0
        h6p = 0
        h7p = 0
        h8p = 0
        h9p = 0
        
        tileImage = UIImage(named: "empty.png")
        
        self.a1i.image = tileImage
        self.a2i.image = tileImage
        self.a3i.image = tileImage
        self.a4i.image = tileImage
        self.a5i.image = tileImage
        self.a6i.image = tileImage
        self.a7i.image = tileImage
        self.a8i.image = tileImage
        self.a9i.image = tileImage
        self.b1i.image = tileImage
        self.b2i.image = tileImage
        self.b3i.image = tileImage
        self.b4i.image = tileImage
        self.b5i.image = tileImage
        self.b6i.image = tileImage
        self.b7i.image = tileImage
        self.b8i.image = tileImage
        self.b9i.image = tileImage
        self.c1i.image = tileImage
        self.c2i.image = tileImage
        self.c3i.image = tileImage
        self.c4i.image = tileImage
        self.c5i.image = tileImage
        self.c6i.image = tileImage
        self.c7i.image = tileImage
        self.c8i.image = tileImage
        self.c9i.image = tileImage
        self.d1i.image = tileImage
        self.d2i.image = tileImage
        self.d3i.image = tileImage
        self.d4i.image = tileImage
        self.d5i.image = tileImage
        self.d6i.image = tileImage
        self.d7i.image = tileImage
        self.d8i.image = tileImage
        self.d9i.image = tileImage
        self.e1i.image = tileImage
        self.e2i.image = tileImage
        self.e3i.image = tileImage
        self.e4i.image = tileImage
        self.e5i.image = tileImage
        self.e6i.image = tileImage
        self.e7i.image = tileImage
        self.e8i.image = tileImage
        self.e9i.image = tileImage
        self.f1i.image = tileImage
        self.f2i.image = tileImage
        self.f3i.image = tileImage
        self.f4i.image = tileImage
        self.f5i.image = tileImage
        self.f6i.image = tileImage
        self.f7i.image = tileImage
        self.f8i.image = tileImage
        self.f9i.image = tileImage
        self.g1i.image = tileImage
        self.g2i.image = tileImage
        self.g3i.image = tileImage
        self.g4i.image = tileImage
        self.g5i.image = tileImage
        self.g6i.image = tileImage
        self.g7i.image = tileImage
        self.g8i.image = tileImage
        self.g9i.image = tileImage
        self.h1i.image = tileImage
        self.h2i.image = tileImage
        self.h3i.image = tileImage
        self.h4i.image = tileImage
        self.h5i.image = tileImage
        self.h6i.image = tileImage
        self.h7i.image = tileImage
        self.h8i.image = tileImage
        self.h9i.image = tileImage
    }
    
    func populateTempObjects() {
        if (a1p == 6) {
            pickRandomTemp()
            a1p = temp
        }
        if (a2p == 6) {
            pickRandomTemp()
            a2p = temp
        }
        if (a3p == 6) {
            pickRandomTemp()
            a3p = temp
        }
        if (a4p == 6) {
            pickRandomTemp()
            a4p = temp
        }
        if (a5p == 6) {
            pickRandomTemp()
            a5p = temp
        }
        if (a6p == 6) {
            pickRandomTemp()
            a6p = temp
        }
        if (a7p == 6) {
            pickRandomTemp()
            a7p = temp
        }
        if (a8p == 6) {
            pickRandomTemp()
            a8p = temp
        }
        if (a9p == 6) {
            pickRandomTemp()
            a9p = temp
        }
        if (b1p == 6) {
            pickRandomTemp()
            b1p = temp
        }
        if (b2p == 6) {
            pickRandomTemp()
            b2p = temp
        }
        if (b3p == 6) {
            pickRandomTemp()
            b3p = temp
        }
        if (b4p == 6) {
            pickRandomTemp()
            b4p = temp
        }
        if (b5p == 6) {
            pickRandomTemp()
            b5p = temp
        }
        if (b6p == 6) {
            pickRandomTemp()
            b6p = temp
        }
        if (b7p == 6) {
            pickRandomTemp()
            b7p = temp
        }
        if (b8p == 6) {
            pickRandomTemp()
            b8p = temp
        }
        if (b9p == 6) {
            pickRandomTemp()
            b9p = temp
        }
        if (c1p == 6) {
            pickRandomTemp()
            c1p = temp
        }
        if (c2p == 6) {
            pickRandomTemp()
            c2p = temp
        }
        if (c3p == 6) {
            pickRandomTemp()
            c3p = temp
        }
        if (c4p == 6) {
            pickRandomTemp()
            c4p = temp
        }
        if (c5p == 6) {
            pickRandomTemp()
            c5p = temp
        }
        if (c6p == 6) {
            pickRandomTemp()
            c6p = temp
        }
        if (c7p == 6) {
            pickRandomTemp()
            c7p = temp
        }
        if (c8p == 6) {
            pickRandomTemp()
            c8p = temp
        }
        if (c9p == 6) {
            pickRandomTemp()
            c9p = temp
        }
        if (d1p == 6) {
            pickRandomTemp()
            d1p = temp
        }
        if (d2p == 6) {
            pickRandomTemp()
            d2p = temp
        }
        if (d3p == 6) {
            pickRandomTemp()
            d3p = temp
        }
        if (d4p == 6) {
            pickRandomTemp()
            d4p = temp
        }
        if (d5p == 6) {
            pickRandomTemp()
            d5p = temp
        }
        if (d6p == 6) {
            pickRandomTemp()
            d6p = temp
        }
        if (d7p == 6) {
            pickRandomTemp()
            d7p = temp
        }
        if (d8p == 6) {
            pickRandomTemp()
            d8p = temp
        }
        if (d9p == 6) {
            pickRandomTemp()
            d9p = temp
        }
        if (e1p == 6) {
            pickRandomTemp()
            e1p = temp
        }
        if (e2p == 6) {
            pickRandomTemp()
            e2p = temp
        }
        if (e3p == 6) {
            pickRandomTemp()
            e3p = temp
        }
        if (e4p == 6) {
            pickRandomTemp()
            e4p = temp
        }
        if (e5p == 6) {
            pickRandomTemp()
            e5p = temp
        }
        if (e6p == 6) {
            pickRandomTemp()
            e6p = temp
        }
        if (e7p == 6) {
            pickRandomTemp()
            e7p = temp
        }
        if (e8p == 6) {
            pickRandomTemp()
            e8p = temp
        }
        if (e9p == 6) {
            pickRandomTemp()
            e9p = temp
        }
        if (f1p == 6) {
            pickRandomTemp()
            f1p = temp
        }
        if (f2p == 6) {
            pickRandomTemp()
            f2p = temp
        }
        if (f3p == 6) {
            pickRandomTemp()
            f3p = temp
        }
        if (f4p == 6) {
            pickRandomTemp()
            f4p = temp
        }
        if (f5p == 6) {
            pickRandomTemp()
            f5p = temp
        }
        if (f6p == 6) {
            pickRandomTemp()
            f6p = temp
        }
        if (f7p == 6) {
            pickRandomTemp()
            f7p = temp
        }
        if (f8p == 6) {
            pickRandomTemp()
            f8p = temp
        }
        if (f9p == 6) {
            pickRandomTemp()
            f9p = temp
        }
        if (g1p == 6) {
            pickRandomTemp()
            g1p = temp
        }
        if (g2p == 6) {
            pickRandomTemp()
            g2p = temp
        }
        if (g3p == 6) {
            pickRandomTemp()
            g3p = temp
        }
        if (g4p == 6) {
            pickRandomTemp()
            g4p = temp
        }
        if (g5p == 6) {
            pickRandomTemp()
            g5p = temp
        }
        if (g6p == 6) {
            pickRandomTemp()
            g6p = temp
        }
        if (g7p == 6) {
            pickRandomTemp()
            g7p = temp
        }
        if (g8p == 6) {
            pickRandomTemp()
            g8p = temp
        }
        if (g9p == 6) {
            pickRandomTemp()
            g9p = temp
        }
        if (h1p == 6) {
            pickRandomTemp()
            h1p = temp
        }
        if (h2p == 6) {
            pickRandomTemp()
            h2p = temp
        }
        if (h3p == 6) {
            pickRandomTemp()
            h3p = temp
        }
        if (h4p == 6) {
            pickRandomTemp()
            h4p = temp
        }
        if (h5p == 6) {
            pickRandomTemp()
            h5p = temp
        }
        if (h6p == 6) {
            pickRandomTemp()
            h6p = temp
        }
        if (h7p == 6) {
            pickRandomTemp()
            h7p = temp
        }
        if (h8p == 6) {
            pickRandomTemp()
            h8p = temp
        }
        if (h9p == 6) {
            pickRandomTemp()
            h9p = temp
        }
    }
    
    func pickRandomTemp() {
        let tempspec = arc4random() % 10
        if (tempspec == 0) {
            temp = 7
        }
        else if (tempspec == 1) {
            temp = 9
        }
        else if (tempspec == 2) {
            temp = 10
        }
        else if (tempspec == 3) {
            temp = 13
        }
        else {
            temp = 0
        }
    }
    
    func newWebs() {
        //basic web spawning code, will change later
        let webspec = arc4random() % 2
        if (webspec == 0) {
            //if this method is used, one of four corner webs will generate
            let webloc = arc4random() % 4
            if (webloc == 0) {
                b2p = 5
            }
            if (webloc == 1) {
                b8p = 5
            }
            if (webloc == 2) {
                g2p = 5
            }
            if (webloc == 3) {
                g8p = 5
            }
        }
        if (webspec == 1) {
            //if this method is used, a set of edge webs will generate
        }
    }
    
    
    
    func newDoor() {
        if (room == 0) {
            a5p = 3
            exitDoorX = 5
            exitDoorY = 1
        }
        else {
            //setting door coordinates, assuming only specific axis for Y
            exitDoorY = 1
            
            //basic door spawning code, will change later
            let doorloc = arc4random() % 7
            if (doorloc == 0) {
                a2p = 3
                exitDoorX = 2
            }
            if (doorloc == 1) {
                a3p = 3
                exitDoorX = 3
            }
            if (doorloc == 2) {
                a4p = 3
                exitDoorX = 4
            }
            if (doorloc == 3) {
                a5p = 3
                exitDoorX = 5
            }
            if (doorloc == 4) {
                a6p = 3
                exitDoorX = 6
            }
            if (doorloc == 5) {
                a7p = 3
                exitDoorX = 7
            }
            if (doorloc == 6) {
                a8p = 3
                exitDoorX = 8
            }
        }
    }
    
    func newStairs() {
        //setting door coordinates, assuming only specific axis for Y
        stairsY = 8
        
        //basic stairs spawning code, will change later
        let stairsloc = arc4random() % 7
        if (stairsloc == 0) {
            h2p = 4
            stairsX = 2
            
            self.player.center = CGPoint(x: self.h2i.center.x, y: self.h2i.center.y - 48)
        }
        if (stairsloc == 1) {
            h3p = 4
            stairsX = 3
            
            self.player.center = CGPoint(x: self.h3i.center.x, y: self.h3i.center.y - 48)
        }
        if (stairsloc == 2) {
            h4p = 4
            stairsX = 4
            
            self.player.center = CGPoint(x: self.h4i.center.x, y: self.h4i.center.y - 48)
        }
        if (stairsloc == 3) {
            h5p = 4
            stairsX = 5
            
            self.player.center = CGPoint(x: self.h5i.center.x, y: self.h5i.center.y - 48)
        }
        if (stairsloc == 4) {
            h6p = 4
            stairsX = 6
            
            self.player.center = CGPoint(x: self.h6i.center.x, y: self.h6i.center.y - 48)
        }
        if (stairsloc == 5) {
            h7p = 4
            stairsX = 7
            
            self.player.center = CGPoint(x: self.h7i.center.x, y: self.h7i.center.y - 48)
        }
        if (stairsloc == 6) {
            h8p = 4
            stairsX = 8
            
            self.player.center = CGPoint(x: self.h8i.center.x, y: self.h8i.center.y - 48)
        }
        
        //set player location to just above the stairs spawn
        playerY = stairsY - 1
        playerX = stairsX
    }
    
    func loadSprites() {
        //this function is going to have a lot of stuff to do...
        if (a1p == 1) {
            a1i.image = randomizeWalls()
        }
        else if (a1p == 2) {
            a1i.image = randomizeEdges()
        }
        else if (a1p == 3) {
            self.a1i.image = UIImage(named: "door-open.png")
        }
        else if (a1p == 4) {
            self.a1i.image = UIImage(named: "down-stairs.png")
        }
        else if (a1p == 7) {
            self.a1i.image = UIImage(named: "water.png")
        }
        else if (a1p == 9) {
            self.a1i.image = UIImage(named: "candles.png")
        }
        else if (a1p == 10) {
            self.a1i.image = UIImage(named: "fallen-angel.png")
        }
        else if (a1p == 13) {
            self.a1i.image = UIImage(named: "stockade.png")
        }
        if (a2p == 1) {
            a2i.image = randomizeWalls()
        }
        else if (a2p == 2) {
            a2i.image = randomizeEdges()
        }
        else if (a2p == 3) {
            self.a2i.image = UIImage(named: "door-open.png")
        }
        else if (a2p == 4) {
            self.a2i.image = UIImage(named: "down-stairs.png")
        }
        else if (a2p == 7) {
            self.a2i.image = UIImage(named: "water.png")
        }
        else if (a2p == 9) {
            self.a2i.image = UIImage(named: "candles.png")
        }
        else if (a2p == 10) {
            self.a2i.image = UIImage(named: "fallen-angel.png")
        }
        else if (a2p == 13) {
            self.a2i.image = UIImage(named: "stockade.png")
        }
        if (a3p == 1) {
            a3i.image = randomizeWalls()
        }
        else if (a3p == 2) {
            a3i.image = randomizeEdges()
        }
        else if (a3p == 3) {
            self.a3i.image = UIImage(named: "door-open.png")
        }
        else if (a3p == 4) {
            self.a3i.image = UIImage(named: "down-stairs.png")
        }
        else if (a3p == 7) {
            self.a3i.image = UIImage(named: "water.png")
        }
        else if (a3p == 9) {
            self.a3i.image = UIImage(named: "candles.png")
        }
        else if (a3p == 10) {
            self.a3i.image = UIImage(named: "fallen-angel.png")
        }
        else if (a3p == 13) {
            self.a3i.image = UIImage(named: "stockade.png")
        }
        if (a4p == 1) {
            a4i.image = randomizeWalls()
        }
        else if (a4p == 2) {
            a4i.image = randomizeEdges()
        }
        else if (a4p == 3) {
            self.a4i.image = UIImage(named: "door-open.png")
        }
        else if (a4p == 4) {
            self.a4i.image = UIImage(named: "down-stairs.png")
        }
        else if (a4p == 7) {
            self.a4i.image = UIImage(named: "water.png")
        }
        else if (a4p == 9) {
            self.a4i.image = UIImage(named: "candles.png")
        }
        else if (a4p == 10) {
            self.a4i.image = UIImage(named: "fallen-angel.png")
        }
        else if (a4p == 13) {
            self.a4i.image = UIImage(named: "stockade.png")
        }
        if (a5p == 1) {
            a5i.image = randomizeWalls()
        }
        else if (a5p == 2) {
            a5i.image = randomizeEdges()
        }
        else if (a5p == 3) {
            self.a5i.image = UIImage(named: "door-open.png")
        }
        else if (a5p == 4) {
            self.a5i.image = UIImage(named: "down-stairs.png")
        }
        else if (a5p == 7) {
            self.a5i.image = UIImage(named: "water.png")
        }
        else if (a5p == 9) {
            self.a5i.image = UIImage(named: "candles.png")
        }
        else if (a5p == 10) {
            self.a5i.image = UIImage(named: "fallen-angel.png")
        }
        else if (a5p == 13) {
            self.a5i.image = UIImage(named: "stockade.png")
        }
        if (a6p == 1) {
            a6i.image = randomizeWalls()
        }
        else if (a6p == 2) {
            a6i.image = randomizeEdges()
        }
        else if (a6p == 3) {
            self.a6i.image = UIImage(named: "door-open.png")
        }
        else if (a6p == 4) {
            self.a6i.image = UIImage(named: "down-stairs.png")
        }
        else if (a6p == 7) {
            self.a6i.image = UIImage(named: "water.png")
        }
        else if (a6p == 9) {
            self.a6i.image = UIImage(named: "candles.png")
        }
        else if (a6p == 10) {
            self.a6i.image = UIImage(named: "fallen-angel.png")
        }
        else if (a6p == 13) {
            self.a6i.image = UIImage(named: "stockade.png")
        }
        if (a7p == 1) {
            a7i.image = randomizeWalls()
        }
        else if (a7p == 2) {
            a7i.image = randomizeEdges()
        }
        else if (a7p == 3) {
            self.a7i.image = UIImage(named: "door-open.png")
        }
        else if (a7p == 4) {
            self.a7i.image = UIImage(named: "down-stairs.png")
        }
        else if (a7p == 7) {
            self.a7i.image = UIImage(named: "water.png")
        }
        else if (a7p == 9) {
            self.a7i.image = UIImage(named: "candles.png")
        }
        else if (a7p == 10) {
            self.a7i.image = UIImage(named: "fallen-angel.png")
        }
        else if (a7p == 13) {
            self.a7i.image = UIImage(named: "stockade.png")
        }
        if (a8p == 1) {
            a8i.image = randomizeWalls()
        }
        else if (a8p == 2) {
            a8i.image = randomizeEdges()
        }
        else if (a8p == 3) {
            self.a8i.image = UIImage(named: "door-open.png")
        }
        else if (a8p == 4) {
            self.a8i.image = UIImage(named: "down-stairs.png")
        }
        else if (a8p == 7) {
            self.a8i.image = UIImage(named: "water.png")
        }
        else if (a8p == 9) {
            self.a8i.image = UIImage(named: "candles.png")
        }
        else if (a8p == 10) {
            self.a8i.image = UIImage(named: "fallen-angel.png")
        }
        else if (a8p == 13) {
            self.a8i.image = UIImage(named: "stockade.png")
        }
        if (a9p == 1) {
            a9i.image = randomizeWalls()
        }
        else if (a9p == 2) {
            a9i.image = randomizeEdges()
        }
        else if (a9p == 3) {
            self.a9i.image = UIImage(named: "door-open.png")
        }
        else if (a9p == 4) {
            self.a9i.image = UIImage(named: "down-stairs.png")
        }
        else if (a9p == 7) {
            self.a9i.image = UIImage(named: "water.png")
        }
        else if (a9p == 9) {
            self.a9i.image = UIImage(named: "candles.png")
        }
        else if (a9p == 10) {
            self.a9i.image = UIImage(named: "fallen-angel.png")
        }
        else if (a9p == 13) {
            self.a9i.image = UIImage(named: "stockade.png")
        }
        
        if (b1p == 1) {
            b1i.image = randomizeWalls()
        }
        else if (b1p == 2) {
            b1i.image = randomizeEdges()
        }
        else if (b1p == 3) {
            self.b1i.image = UIImage(named: "door-open.png")
        }
        else if (b1p == 4) {
            self.b1i.image = UIImage(named: "down-stairs.png")
        }
        else if (b1p == 7) {
            self.b1i.image = UIImage(named: "water.png")
        }
        else if (b1p == 9) {
            self.b1i.image = UIImage(named: "candles.png")
        }
        else if (b1p == 10) {
            self.b1i.image = UIImage(named: "fallen-angel.png")
        }
        else if (b1p == 13) {
            self.b1i.image = UIImage(named: "stockade.png")
        }
        if (b2p == 1) {
            b2i.image = randomizeWalls()
        }
        else if (b2p == 2) {
            b2i.image = randomizeEdges()
        }
        else if (b2p == 3) {
            self.b2i.image = UIImage(named: "door-open.png")
        }
        else if (b2p == 4) {
            self.b2i.image = UIImage(named: "down-stairs.png")
        }
        else if (b2p == 5) {
            self.b2i.image = UIImage(named: "web-upper-left.png")
        }
        else if (b2p == 7) {
            self.b2i.image = UIImage(named: "water.png")
        }
        else if (b2p == 9) {
            self.b2i.image = UIImage(named: "candles.png")
        }
        else if (b2p == 10) {
            self.b2i.image = UIImage(named: "fallen-angel.png")
        }
        else if (b2p == 13) {
            self.b2i.image = UIImage(named: "stockade.png")
        }
        if (b3p == 1) {
            b3i.image = randomizeWalls()
        }
        else if (b3p == 2) {
            b3i.image = randomizeEdges()
        }
        else if (b3p == 3) {
            self.b3i.image = UIImage(named: "door-open.png")
        }
        else if (b3p == 4) {
            self.b3i.image = UIImage(named: "down-stairs.png")
        }
        else if (b3p == 7) {
            self.b3i.image = UIImage(named: "water.png")
        }
        else if (b3p == 9) {
            self.b3i.image = UIImage(named: "candles.png")
        }
        else if (b3p == 10) {
            self.b3i.image = UIImage(named: "fallen-angel.png")
        }
        else if (b3p == 13) {
            self.b3i.image = UIImage(named: "stockade.png")
        }
        if (b4p == 1) {
            b4i.image = randomizeWalls()
        }
        else if (b4p == 2) {
            b4i.image = randomizeEdges()
        }
        else if (b4p == 3) {
            self.b4i.image = UIImage(named: "door-open.png")
        }
        else if (b4p == 4) {
            self.b4i.image = UIImage(named: "down-stairs.png")
        }
        else if (b4p == 7) {
            self.b4i.image = UIImage(named: "water.png")
        }
        else if (b4p == 9) {
            self.b4i.image = UIImage(named: "candles.png")
        }
        else if (b4p == 10) {
            self.b4i.image = UIImage(named: "fallen-angel.png")
        }
        else if (b4p == 13) {
            self.b4i.image = UIImage(named: "stockade.png")
        }
        if (b5p == 1) {
            b5i.image = randomizeWalls()
        }
        else if (b5p == 2) {
            b5i.image = randomizeEdges()
        }
        else if (b5p == 3) {
            self.b5i.image = UIImage(named: "door-open.png")
        }
        else if (b5p == 4) {
            self.b5i.image = UIImage(named: "down-stairs.png")
        }
        else if (b5p == 7) {
            self.b5i.image = UIImage(named: "water.png")
        }
        else if (b5p == 9) {
            self.b5i.image = UIImage(named: "candles.png")
        }
        else if (b5p == 10) {
            self.b5i.image = UIImage(named: "fallen-angel.png")
        }
        else if (b5p == 13) {
            self.b5i.image = UIImage(named: "stockade.png")
        }
        if (b6p == 1) {
            b6i.image = randomizeWalls()
        }
        else if (b6p == 2) {
            b6i.image = randomizeEdges()
        }
        else if (b6p == 3) {
            self.b6i.image = UIImage(named: "door-open.png")
        }
        else if (b6p == 4) {
            self.b6i.image = UIImage(named: "down-stairs.png")
        }
        else if (b6p == 7) {
            self.b6i.image = UIImage(named: "water.png")
        }
        else if (b6p == 9) {
            self.b6i.image = UIImage(named: "candles.png")
        }
        else if (b6p == 10) {
            self.b6i.image = UIImage(named: "fallen-angel.png")
        }
        else if (b6p == 13) {
            self.b6i.image = UIImage(named: "stockade.png")
        }
        if (b7p == 1) {
            b7i.image = randomizeWalls()
        }
        else if (b7p == 2) {
            b7i.image = randomizeEdges()
        }
        else if (b7p == 3) {
            self.b7i.image = UIImage(named: "door-open.png")
        }
        else if (b7p == 4) {
            self.b7i.image = UIImage(named: "down-stairs.png")
        }
        else if (b7p == 7) {
            self.b7i.image = UIImage(named: "water.png")
        }
        else if (b7p == 9) {
            self.b7i.image = UIImage(named: "candles.png")
        }
        else if (b7p == 10) {
            self.b7i.image = UIImage(named: "fallen-angel.png")
        }
        else if (b7p == 13) {
            self.b7i.image = UIImage(named: "stockade.png")
        }
        if (b8p == 1) {
            b8i.image = randomizeWalls()
        }
        else if (b8p == 2) {
            b8i.image = randomizeEdges()
        }
        else if (b8p == 3) {
            self.b8i.image = UIImage(named: "door-open.png")
        }
        else if (b8p == 4) {
            self.b8i.image = UIImage(named: "down-stairs.png")
        }
        else if (b8p == 5) {
            self.b8i.image = UIImage(named: "web-upper-right.png")
        }
        else if (b8p == 7) {
            self.b8i.image = UIImage(named: "water.png")
        }
        else if (b8p == 9) {
            self.b8i.image = UIImage(named: "candles.png")
        }
        else if (b8p == 10) {
            self.b8i.image = UIImage(named: "fallen-angel.png")
        }
        else if (b8p == 13) {
            self.b8i.image = UIImage(named: "stockade.png")
        }
        if (b9p == 1) {
            b9i.image = randomizeWalls()
        }
        else if (b9p == 2) {
            b9i.image = randomizeEdges()
        }
        else if (b9p == 3) {
            self.b9i.image = UIImage(named: "door-open.png")
        }
        else if (b9p == 4) {
            self.b9i.image = UIImage(named: "down-stairs.png")
        }
        else if (b9p == 7) {
            self.b9i.image = UIImage(named: "water.png")
        }
        else if (b9p == 9) {
            self.b9i.image = UIImage(named: "candles.png")
        }
        else if (b9p == 10) {
            self.b9i.image = UIImage(named: "fallen-angel.png")
        }
        else if (b9p == 13) {
            self.b9i.image = UIImage(named: "stockade.png")
        }
        
        if (c1p == 1) {
            c1i.image = randomizeWalls()
        }
        else if (c1p == 2) {
            c1i.image = randomizeEdges()
        }
        else if (c1p == 3) {
            self.c1i.image = UIImage(named: "door-open.png")
        }
        else if (c1p == 4) {
            self.c1i.image = UIImage(named: "down-stairs.png")
        }
        else if (c1p == 7) {
            self.c1i.image = UIImage(named: "water.png")
        }
        else if (c1p == 9) {
            self.c1i.image = UIImage(named: "candles.png")
        }
        else if (c1p == 10) {
            self.c1i.image = UIImage(named: "fallen-angel.png")
        }
        else if (c1p == 13) {
            self.c1i.image = UIImage(named: "stockade.png")
        }
        if (c2p == 1) {
            c2i.image = randomizeWalls()
        }
        else if (c2p == 2) {
            c2i.image = randomizeEdges()
        }
        else if (c2p == 3) {
            self.c2i.image = UIImage(named: "door-open.png")
        }
        else if (c2p == 4) {
            self.c2i.image = UIImage(named: "down-stairs.png")
        }
        else if (c2p == 5) {
            self.c2i.image = UIImage(named: "web-upper-left.png")
        }
        else if (c2p == 7) {
            self.c2i.image = UIImage(named: "water.png")
        }
        else if (c2p == 9) {
            self.c2i.image = UIImage(named: "candles.png")
        }
        else if (c2p == 10) {
            self.c2i.image = UIImage(named: "fallen-angel.png")
        }
        else if (c2p == 13) {
            self.c2i.image = UIImage(named: "stockade.png")
        }
        if (c3p == 1) {
            c3i.image = randomizeWalls()
        }
        else if (c3p == 2) {
            c3i.image = randomizeEdges()
        }
        else if (c3p == 3) {
            self.c3i.image = UIImage(named: "door-open.png")
        }
        else if (c3p == 4) {
            self.c3i.image = UIImage(named: "down-stairs.png")
        }
        else if (c3p == 7) {
            self.c3i.image = UIImage(named: "water.png")
        }
        else if (c3p == 9) {
            self.c3i.image = UIImage(named: "candles.png")
        }
        else if (c3p == 10) {
            self.c3i.image = UIImage(named: "fallen-angel.png")
        }
        else if (c3p == 13) {
            self.c3i.image = UIImage(named: "stockade.png")
        }
        if (c4p == 1) {
            c4i.image = randomizeWalls()
        }
        else if (c4p == 2) {
            c4i.image = randomizeEdges()
        }
        else if (c4p == 3) {
            self.c4i.image = UIImage(named: "door-open.png")
        }
        else if (c4p == 4) {
            self.c4i.image = UIImage(named: "down-stairs.png")
        }
        else if (c4p == 7) {
            self.c4i.image = UIImage(named: "water.png")
        }
        else if (c4p == 9) {
            self.c4i.image = UIImage(named: "candles.png")
        }
        else if (c4p == 10) {
            self.c4i.image = UIImage(named: "fallen-angel.png")
        }
        else if (c4p == 13) {
            self.c4i.image = UIImage(named: "stockade.png")
        }
        if (c5p == 1) {
            c5i.image = randomizeWalls()
        }
        else if (c5p == 2) {
            c5i.image = randomizeEdges()
        }
        else if (c5p == 3) {
            self.c5i.image = UIImage(named: "door-open.png")
        }
        else if (c5p == 4) {
            self.c5i.image = UIImage(named: "down-stairs.png")
        }
        else if (c5p == 7) {
            self.c5i.image = UIImage(named: "water.png")
        }
        else if (c5p == 9) {
            self.c5i.image = UIImage(named: "candles.png")
        }
        else if (c5p == 10) {
            self.c5i.image = UIImage(named: "fallen-angel.png")
        }
        else if (c5p == 13) {
            self.c5i.image = UIImage(named: "stockade.png")
        }
        if (c6p == 1) {
            c6i.image = randomizeWalls()
        }
        else if (c6p == 2) {
            c6i.image = randomizeEdges()
        }
        else if (c6p == 3) {
            self.c6i.image = UIImage(named: "door-open.png")
        }
        else if (c6p == 4) {
            self.c6i.image = UIImage(named: "down-stairs.png")
        }
        else if (c6p == 7) {
            self.c6i.image = UIImage(named: "water.png")
        }
        else if (c6p == 9) {
            self.c6i.image = UIImage(named: "candles.png")
        }
        else if (c6p == 10) {
            self.c6i.image = UIImage(named: "fallen-angel.png")
        }
        else if (c6p == 13) {
            self.c6i.image = UIImage(named: "stockade.png")
        }
        if (c7p == 1) {
            c7i.image = randomizeWalls()
        }
        else if (c7p == 2) {
            c7i.image = randomizeEdges()
        }
        else if (c7p == 3) {
            self.c7i.image = UIImage(named: "door-open.png")
        }
        else if (c7p == 4) {
            self.c7i.image = UIImage(named: "down-stairs.png")
        }
        else if (c7p == 7) {
            self.c7i.image = UIImage(named: "water.png")
        }
        else if (c7p == 9) {
            self.c7i.image = UIImage(named: "candles.png")
        }
        else if (c7p == 10) {
            self.c7i.image = UIImage(named: "fallen-angel.png")
        }
        else if (c7p == 13) {
            self.c7i.image = UIImage(named: "stockade.png")
        }
        if (c8p == 1) {
            c8i.image = randomizeWalls()
        }
        else if (c8p == 2) {
            c8i.image = randomizeEdges()
        }
        else if (c8p == 3) {
            self.c8i.image = UIImage(named: "door-open.png")
        }
        else if (c8p == 4) {
            self.c8i.image = UIImage(named: "down-stairs.png")
        }
        else if (c8p == 5) {
            self.c8i.image = UIImage(named: "web-upper-right.png")
        }
        else if (c8p == 7) {
            self.c8i.image = UIImage(named: "water.png")
        }
        else if (c8p == 9) {
            self.c8i.image = UIImage(named: "candles.png")
        }
        else if (c8p == 10) {
            self.c8i.image = UIImage(named: "fallen-angel.png")
        }
        else if (c8p == 13) {
            self.c8i.image = UIImage(named: "stockade.png")
        }
        if (c9p == 1) {
            c9i.image = randomizeWalls()
        }
        else if (c9p == 2) {
            c9i.image = randomizeEdges()
        }
        else if (c9p == 3) {
            self.c9i.image = UIImage(named: "door-open.png")
        }
        else if (c9p == 4) {
            self.c9i.image = UIImage(named: "down-stairs.png")
        }
        else if (c9p == 7) {
            self.c9i.image = UIImage(named: "water.png")
        }
        else if (c9p == 9) {
            self.c9i.image = UIImage(named: "candles.png")
        }
        else if (c9p == 10) {
            self.c9i.image = UIImage(named: "fallen-angel.png")
        }
        else if (c9p == 13) {
            self.c9i.image = UIImage(named: "stockade.png")
        }
        
        if (d1p == 1) {
            d1i.image = randomizeWalls()
        }
        else if (d1p == 2) {
            d1i.image = randomizeEdges()
        }
        else if (d1p == 3) {
            self.d1i.image = UIImage(named: "door-open.png")
        }
        else if (d1p == 4) {
            self.d1i.image = UIImage(named: "down-stairs.png")
        }
        else if (d1p == 7) {
            self.d1i.image = UIImage(named: "water.png")
        }
        else if (d1p == 9) {
            self.d1i.image = UIImage(named: "candles.png")
        }
        else if (d1p == 10) {
            self.d1i.image = UIImage(named: "fallen-angel.png")
        }
        else if (d1p == 13) {
            self.d1i.image = UIImage(named: "stockade.png")
        }
        if (d2p == 1) {
            d2i.image = randomizeWalls()
        }
        else if (d2p == 2) {
            d2i.image = randomizeEdges()
        }
        else if (d2p == 3) {
            self.d2i.image = UIImage(named: "door-open.png")
        }
        else if (d2p == 4) {
            self.d2i.image = UIImage(named: "down-stairs.png")
        }
        else if (d2p == 5) {
            self.d2i.image = UIImage(named: "web-upper-left.png")
        }
        else if (d2p == 7) {
            self.d2i.image = UIImage(named: "water.png")
        }
        else if (d2p == 9) {
            self.d2i.image = UIImage(named: "candles.png")
        }
        else if (d2p == 10) {
            self.d2i.image = UIImage(named: "fallen-angel.png")
        }
        else if (d2p == 13) {
            self.d2i.image = UIImage(named: "stockade.png")
        }
        if (d3p == 1) {
            d3i.image = randomizeWalls()
        }
        else if (d3p == 2) {
            d3i.image = randomizeEdges()
        }
        else if (d3p == 3) {
            self.d3i.image = UIImage(named: "door-open.png")
        }
        else if (d3p == 4) {
            self.d3i.image = UIImage(named: "down-stairs.png")
        }
        else if (d3p == 7) {
            self.d3i.image = UIImage(named: "water.png")
        }
        else if (d3p == 9) {
            self.d3i.image = UIImage(named: "candles.png")
        }
        else if (d3p == 10) {
            self.d3i.image = UIImage(named: "fallen-angel.png")
        }
        else if (d3p == 13) {
            self.d3i.image = UIImage(named: "stockade.png")
        }
        if (d4p == 1) {
            d4i.image = randomizeWalls()
        }
        else if (d4p == 2) {
            d4i.image = randomizeEdges()
        }
        else if (d4p == 3) {
            self.d4i.image = UIImage(named: "door-open.png")
        }
        else if (d4p == 4) {
            self.d4i.image = UIImage(named: "down-stairs.png")
        }
        else if (d4p == 7) {
            self.d4i.image = UIImage(named: "water.png")
        }
        else if (d4p == 9) {
            self.d4i.image = UIImage(named: "candles.png")
        }
        else if (d4p == 10) {
            self.d4i.image = UIImage(named: "fallen-angel.png")
        }
        else if (d4p == 13) {
            self.d4i.image = UIImage(named: "stockade.png")
        }
        if (d5p == 1) {
            d5i.image = randomizeWalls()
        }
        else if (d5p == 2) {
            d5i.image = randomizeEdges()
        }
        else if (d5p == 3) {
            self.d5i.image = UIImage(named: "door-open.png")
        }
        else if (d5p == 4) {
            self.d5i.image = UIImage(named: "down-stairs.png")
        }
        else if (d5p == 7) {
            self.d5i.image = UIImage(named: "water.png")
        }
        else if (d5p == 9) {
            self.d5i.image = UIImage(named: "candles.png")
        }
        else if (d5p == 10) {
            self.d5i.image = UIImage(named: "fallen-angel.png")
        }
        else if (d5p == 13) {
            self.d5i.image = UIImage(named: "stockade.png")
        }
        if (d6p == 1) {
            d6i.image = randomizeWalls()
        }
        else if (d6p == 2) {
            d6i.image = randomizeEdges()
        }
        else if (d6p == 3) {
            self.d6i.image = UIImage(named: "door-open.png")
        }
        else if (d6p == 4) {
            self.d6i.image = UIImage(named: "down-stairs.png")
        }
        else if (d6p == 7) {
            self.d6i.image = UIImage(named: "water.png")
        }
        else if (d6p == 9) {
            self.d6i.image = UIImage(named: "candles.png")
        }
        else if (d6p == 10) {
            self.d6i.image = UIImage(named: "fallen-angel.png")
        }
        else if (d6p == 13) {
            self.d6i.image = UIImage(named: "stockade.png")
        }
        if (d7p == 1) {
            d7i.image = randomizeWalls()
        }
        else if (d7p == 2) {
            d7i.image = randomizeEdges()
        }
        else if (d7p == 3) {
            self.d7i.image = UIImage(named: "door-open.png")
        }
        else if (d7p == 4) {
            self.d7i.image = UIImage(named: "down-stairs.png")
        }
        else if (d7p == 7) {
            self.d7i.image = UIImage(named: "water.png")
        }
        else if (d7p == 9) {
            self.d7i.image = UIImage(named: "candles.png")
        }
        else if (d7p == 10) {
            self.d7i.image = UIImage(named: "fallen-angel.png")
        }
        else if (d7p == 13) {
            self.d7i.image = UIImage(named: "stockade.png")
        }
        if (d8p == 1) {
            d8i.image = randomizeWalls()
        }
        else if (d8p == 2) {
            d8i.image = randomizeEdges()
        }
        else if (d8p == 3) {
            self.d8i.image = UIImage(named: "door-open.png")
        }
        else if (d8p == 4) {
            self.d8i.image = UIImage(named: "down-stairs.png")
        }
        else if (d8p == 5) {
            self.d8i.image = UIImage(named: "web-upper-right.png")
        }
        else if (d8p == 7) {
            self.d8i.image = UIImage(named: "water.png")
        }
        else if (d8p == 9) {
            self.d8i.image = UIImage(named: "candles.png")
        }
        else if (d8p == 10) {
            self.d8i.image = UIImage(named: "fallen-angel.png")
        }
        else if (d8p == 13) {
            self.d8i.image = UIImage(named: "stockade.png")
        }
        if (d9p == 1) {
            d9i.image = randomizeWalls()
        }
        else if (d9p == 2) {
            d9i.image = randomizeEdges()
        }
        else if (d9p == 3) {
            self.d9i.image = UIImage(named: "door-open.png")
        }
        else if (d9p == 4) {
            self.d9i.image = UIImage(named: "down-stairs.png")
        }
        else if (d9p == 7) {
            self.d9i.image = UIImage(named: "water.png")
        }
        else if (d9p == 9) {
            self.d9i.image = UIImage(named: "candles.png")
        }
        else if (d9p == 10) {
            self.d9i.image = UIImage(named: "fallen-angel.png")
        }
        else if (d9p == 13) {
            self.d9i.image = UIImage(named: "stockade.png")
        }
        
        if (e1p == 1) {
            e1i.image = randomizeWalls()
        }
        else if (e1p == 2) {
            e1i.image = randomizeEdges()
        }
        else if (e1p == 3) {
            self.e1i.image = UIImage(named: "door-open.png")
        }
        else if (e1p == 4) {
            self.e1i.image = UIImage(named: "down-stairs.png")
        }
        else if (e1p == 7) {
            self.e1i.image = UIImage(named: "water.png")
        }
        else if (e1p == 9) {
            self.e1i.image = UIImage(named: "candles.png")
        }
        else if (e1p == 10) {
            self.e1i.image = UIImage(named: "fallen-angel.png")
        }
        else if (e1p == 13) {
            self.e1i.image = UIImage(named: "stockade.png")
        }
        if (e2p == 1) {
            e2i.image = randomizeWalls()
        }
        else if (e2p == 2) {
            e2i.image = randomizeEdges()
        }
        else if (e2p == 3) {
            self.e2i.image = UIImage(named: "door-open.png")
        }
        else if (e2p == 4) {
            self.e2i.image = UIImage(named: "down-stairs.png")
        }
        else if (e2p == 5) {
            self.e2i.image = UIImage(named: "web-upper-left.png")
        }
        else if (e2p == 7) {
            self.e2i.image = UIImage(named: "water.png")
        }
        else if (e2p == 9) {
            self.e2i.image = UIImage(named: "candles.png")
        }
        else if (e2p == 10) {
            self.e2i.image = UIImage(named: "fallen-angel.png")
        }
        else if (e2p == 13) {
            self.e2i.image = UIImage(named: "stockade.png")
        }
        if (e3p == 1) {
            e3i.image = randomizeWalls()
        }
        else if (e3p == 2) {
            e3i.image = randomizeEdges()
        }
        else if (e3p == 3) {
            self.e3i.image = UIImage(named: "door-open.png")
        }
        else if (e3p == 4) {
            self.e3i.image = UIImage(named: "down-stairs.png")
        }
        else if (e3p == 7) {
            self.e3i.image = UIImage(named: "water.png")
        }
        else if (e3p == 9) {
            self.e3i.image = UIImage(named: "candles.png")
        }
        else if (e3p == 10) {
            self.e3i.image = UIImage(named: "fallen-angel.png")
        }
        else if (e3p == 13) {
            self.e3i.image = UIImage(named: "stockade.png")
        }
        if (e4p == 1) {
            e4i.image = randomizeWalls()
        }
        else if (e4p == 2) {
            e4i.image = randomizeEdges()
        }
        else if (e4p == 3) {
            self.e4i.image = UIImage(named: "door-open.png")
        }
        else if (e4p == 4) {
            self.e4i.image = UIImage(named: "down-stairs.png")
        }
        else if (e4p == 7) {
            self.e4i.image = UIImage(named: "water.png")
        }
        else if (e4p == 9) {
            self.e4i.image = UIImage(named: "candles.png")
        }
        else if (e4p == 10) {
            self.e4i.image = UIImage(named: "fallen-angel.png")
        }
        else if (e4p == 13) {
            self.e4i.image = UIImage(named: "stockade.png")
        }
        if (e5p == 1) {
            e5i.image = randomizeWalls()
        }
        else if (e5p == 2) {
            e5i.image = randomizeEdges()
        }
        else if (e5p == 3) {
            self.e5i.image = UIImage(named: "door-open.png")
        }
        else if (e5p == 4) {
            self.e5i.image = UIImage(named: "down-stairs.png")
        }
        else if (e5p == 7) {
            self.e5i.image = UIImage(named: "water.png")
        }
        else if (e5p == 9) {
            self.e5i.image = UIImage(named: "candles.png")
        }
        else if (e5p == 10) {
            self.e5i.image = UIImage(named: "fallen-angel.png")
        }
        else if (e5p == 13) {
            self.e5i.image = UIImage(named: "stockade.png")
        }
        if (e6p == 1) {
            e6i.image = randomizeWalls()
        }
        else if (e6p == 2) {
            e6i.image = randomizeEdges()
        }
        else if (e6p == 3) {
            self.e6i.image = UIImage(named: "door-open.png")
        }
        else if (e6p == 4) {
            self.e6i.image = UIImage(named: "down-stairs.png")
        }
        else if (e6p == 7) {
            self.e6i.image = UIImage(named: "water.png")
        }
        else if (e6p == 9) {
            self.e6i.image = UIImage(named: "candles.png")
        }
        else if (e6p == 10) {
            self.e6i.image = UIImage(named: "fallen-angel.png")
        }
        else if (e6p == 13) {
            self.e6i.image = UIImage(named: "stockade.png")
        }
        if (e7p == 1) {
            e7i.image = randomizeWalls()
        }
        else if (e7p == 2) {
            e7i.image = randomizeEdges()
        }
        else if (e7p == 3) {
            self.e7i.image = UIImage(named: "door-open.png")
        }
        else if (e7p == 4) {
            self.e7i.image = UIImage(named: "down-stairs.png")
        }
        else if (e7p == 7) {
            self.e7i.image = UIImage(named: "water.png")
        }
        else if (e7p == 9) {
            self.e7i.image = UIImage(named: "candles.png")
        }
        else if (e7p == 10) {
            self.e7i.image = UIImage(named: "fallen-angel.png")
        }
        else if (e7p == 13) {
            self.e7i.image = UIImage(named: "stockade.png")
        }
        if (e8p == 1) {
            e8i.image = randomizeWalls()
        }
        else if (e8p == 2) {
            e8i.image = randomizeEdges()
        }
        else if (e8p == 3) {
            self.e8i.image = UIImage(named: "door-open.png")
        }
        else if (e8p == 4) {
            self.e8i.image = UIImage(named: "down-stairs.png")
        }
        else if (e8p == 5) {
            self.e8i.image = UIImage(named: "web-upper-right.png")
        }
        else if (e8p == 7) {
            self.e8i.image = UIImage(named: "water.png")
        }
        else if (e8p == 9) {
            self.e8i.image = UIImage(named: "candles.png")
        }
        else if (e8p == 10) {
            self.e8i.image = UIImage(named: "fallen-angel.png")
        }
        else if (e8p == 13) {
            self.e8i.image = UIImage(named: "stockade.png")
        }
        if (e9p == 1) {
            e9i.image = randomizeWalls()
        }
        else if (e9p == 2) {
            e9i.image = randomizeEdges()
        }
        else if (e9p == 3) {
            self.e9i.image = UIImage(named: "door-open.png")
        }
        else if (e9p == 4) {
            self.e9i.image = UIImage(named: "down-stairs.png")
        }
        else if (e9p == 7) {
            self.e9i.image = UIImage(named: "water.png")
        }
        else if (e9p == 9) {
            self.e9i.image = UIImage(named: "candles.png")
        }
        else if (e9p == 10) {
            self.e9i.image = UIImage(named: "fallen-angel.png")
        }
        else if (e9p == 13) {
            self.e9i.image = UIImage(named: "stockade.png")
        }
        
        if (f1p == 1) {
            f1i.image = randomizeWalls()
        }
        else if (f1p == 2) {
            f1i.image = randomizeEdges()
        }
        else if (f1p == 3) {
            self.f1i.image = UIImage(named: "door-open.png")
        }
        else if (f1p == 4) {
            self.f1i.image = UIImage(named: "down-stairs.png")
        }
        else if (f1p == 7) {
            self.f1i.image = UIImage(named: "water.png")
        }
        else if (f1p == 9) {
            self.f1i.image = UIImage(named: "candles.png")
        }
        else if (f1p == 10) {
            self.f1i.image = UIImage(named: "fallen-angel.png")
        }
        else if (f1p == 13) {
            self.f1i.image = UIImage(named: "stockade.png")
        }
        if (f2p == 1) {
            f2i.image = randomizeWalls()
        }
        else if (f2p == 2) {
            f2i.image = randomizeEdges()
        }
        else if (f2p == 3) {
            self.f2i.image = UIImage(named: "door-open.png")
        }
        else if (f2p == 4) {
            self.f2i.image = UIImage(named: "down-stairs.png")
        }
        else if (f2p == 5) {
            self.f2i.image = UIImage(named: "web-upper-left.png")
        }
        else if (f2p == 7) {
            self.f2i.image = UIImage(named: "water.png")
        }
        else if (f2p == 9) {
            self.f2i.image = UIImage(named: "candles.png")
        }
        else if (f2p == 10) {
            self.f2i.image = UIImage(named: "fallen-angel.png")
        }
        else if (f2p == 13) {
            self.f2i.image = UIImage(named: "stockade.png")
        }
        if (f3p == 1) {
            f3i.image = randomizeWalls()
        }
        else if (f3p == 2) {
            f3i.image = randomizeEdges()
        }
        else if (f3p == 3) {
            self.f3i.image = UIImage(named: "door-open.png")
        }
        else if (f3p == 4) {
            self.f3i.image = UIImage(named: "down-stairs.png")
        }
        else if (f3p == 7) {
            self.f3i.image = UIImage(named: "water.png")
        }
        else if (f3p == 9) {
            self.f3i.image = UIImage(named: "candles.png")
        }
        else if (f3p == 10) {
            self.f3i.image = UIImage(named: "fallen-angel.png")
        }
        else if (f3p == 13) {
            self.f3i.image = UIImage(named: "stockade.png")
        }
        if (f4p == 1) {
            f4i.image = randomizeWalls()
        }
        else if (f4p == 2) {
            f4i.image = randomizeEdges()
        }
        else if (f4p == 3) {
            self.f4i.image = UIImage(named: "door-open.png")
        }
        else if (f4p == 4) {
            self.f4i.image = UIImage(named: "down-stairs.png")
        }
        else if (f4p == 7) {
            self.f4i.image = UIImage(named: "water.png")
        }
        else if (f4p == 9) {
            self.f4i.image = UIImage(named: "candles.png")
        }
        else if (f4p == 10) {
            self.f4i.image = UIImage(named: "fallen-angel.png")
        }
        else if (f4p == 13) {
            self.f4i.image = UIImage(named: "stockade.png")
        }
        if (f5p == 1) {
            f5i.image = randomizeWalls()
        }
        else if (f5p == 2) {
            f5i.image = randomizeEdges()
        }
        else if (f5p == 3) {
            self.f5i.image = UIImage(named: "door-open.png")
        }
        else if (f5p == 4) {
            self.f5i.image = UIImage(named: "down-stairs.png")
        }
        else if (f5p == 7) {
            self.f5i.image = UIImage(named: "water.png")
        }
        else if (f5p == 9) {
            self.f5i.image = UIImage(named: "candles.png")
        }
        else if (f5p == 10) {
            self.f5i.image = UIImage(named: "fallen-angel.png")
        }
        else if (f5p == 13) {
            self.f5i.image = UIImage(named: "stockade.png")
        }
        if (f6p == 1) {
            f6i.image = randomizeWalls()
        }
        else if (f6p == 2) {
            f6i.image = randomizeEdges()
        }
        else if (f6p == 3) {
            self.f6i.image = UIImage(named: "door-open.png")
        }
        else if (f6p == 4) {
            self.f6i.image = UIImage(named: "down-stairs.png")
        }
        else if (f6p == 7) {
            self.f6i.image = UIImage(named: "water.png")
        }
        else if (f6p == 9) {
            self.f6i.image = UIImage(named: "candles.png")
        }
        else if (f6p == 10) {
            self.f6i.image = UIImage(named: "fallen-angel.png")
        }
        else if (f6p == 13) {
            self.f6i.image = UIImage(named: "stockade.png")
        }
        if (f7p == 1) {
            f7i.image = randomizeWalls()
        }
        else if (f7p == 2) {
            f7i.image = randomizeEdges()
        }
        else if (f7p == 3) {
            self.f7i.image = UIImage(named: "door-open.png")
        }
        else if (f7p == 4) {
            self.f7i.image = UIImage(named: "down-stairs.png")
        }
        else if (f7p == 7) {
            self.f7i.image = UIImage(named: "water.png")
        }
        else if (f7p == 9) {
            self.f7i.image = UIImage(named: "candles.png")
        }
        else if (f7p == 10) {
            self.f7i.image = UIImage(named: "fallen-angel.png")
        }
        else if (f7p == 13) {
            self.f7i.image = UIImage(named: "stockade.png")
        }
        if (f8p == 1) {
            f8i.image = randomizeWalls()
        }
        else if (f8p == 2) {
            f8i.image = randomizeEdges()
        }
        else if (f8p == 3) {
            self.f8i.image = UIImage(named: "door-open.png")
        }
        else if (f8p == 4) {
            self.f8i.image = UIImage(named: "down-stairs.png")
        }
        else if (f8p == 5) {
            self.f8i.image = UIImage(named: "web-upper-right.png")
        }
        else if (f8p == 7) {
            self.f8i.image = UIImage(named: "water.png")
        }
        else if (f8p == 9) {
            self.f8i.image = UIImage(named: "candles.png")
        }
        else if (f8p == 10) {
            self.f8i.image = UIImage(named: "fallen-angel.png")
        }
        else if (f8p == 13) {
            self.f8i.image = UIImage(named: "stockade.png")
        }
        if (f9p == 1) {
            f9i.image = randomizeWalls()
        }
        else if (f9p == 2) {
            f9i.image = randomizeEdges()
        }
        else if (f9p == 3) {
            self.f9i.image = UIImage(named: "door-open.png")
        }
        else if (f9p == 4) {
            self.f9i.image = UIImage(named: "down-stairs.png")
        }
        else if (f9p == 7) {
            self.f9i.image = UIImage(named: "water.png")
        }
        else if (f9p == 9) {
            self.f9i.image = UIImage(named: "candles.png")
        }
        else if (f9p == 10) {
            self.f9i.image = UIImage(named: "fallen-angel.png")
        }
        else if (f9p == 13) {
            self.f9i.image = UIImage(named: "stockade.png")
        }
        
        if (g1p == 1) {
            g1i.image = randomizeWalls()
        }
        else if (g1p == 2) {
            g1i.image = randomizeEdges()
        }
        else if (g1p == 3) {
            self.g1i.image = UIImage(named: "door-open.png")
        }
        else if (g1p == 4) {
            self.g1i.image = UIImage(named: "down-stairs.png")
        }
        else if (g1p == 7) {
            self.g1i.image = UIImage(named: "water.png")
        }
        else if (g1p == 9) {
            self.g1i.image = UIImage(named: "candles.png")
        }
        else if (g1p == 10) {
            self.g1i.image = UIImage(named: "fallen-angel.png")
        }
        else if (g1p == 13) {
            self.g1i.image = UIImage(named: "stockade.png")
        }
        if (g2p == 1) {
            g2i.image = randomizeWalls()
        }
        else if (g2p == 2) {
            g2i.image = randomizeEdges()
        }
        else if (g2p == 3) {
            self.g2i.image = UIImage(named: "door-open.png")
        }
        else if (g2p == 4) {
            self.g2i.image = UIImage(named: "down-stairs.png")
        }
        else if (g2p == 5) {
            self.g2i.image = UIImage(named: "web-lower-left.png")
        }
        else if (g2p == 7) {
            self.g2i.image = UIImage(named: "water.png")
        }
        else if (g2p == 9) {
            self.g2i.image = UIImage(named: "candles.png")
        }
        else if (g2p == 10) {
            self.g2i.image = UIImage(named: "fallen-angel.png")
        }
        else if (g2p == 13) {
            self.g2i.image = UIImage(named: "stockade.png")
        }
        if (g3p == 1) {
            g3i.image = randomizeWalls()
        }
        else if (g3p == 2) {
            g3i.image = randomizeEdges()
        }
        else if (g3p == 3) {
            self.g3i.image = UIImage(named: "door-open.png")
        }
        else if (g3p == 4) {
            self.g3i.image = UIImage(named: "down-stairs.png")
        }
        else if (g3p == 7) {
            self.g3i.image = UIImage(named: "water.png")
        }
        else if (g3p == 9) {
            self.g3i.image = UIImage(named: "candles.png")
        }
        else if (g3p == 10) {
            self.g3i.image = UIImage(named: "fallen-angel.png")
        }
        else if (g3p == 13) {
            self.g3i.image = UIImage(named: "stockade.png")
        }
        if (g4p == 1) {
            g4i.image = randomizeWalls()
        }
        else if (g4p == 2) {
            g4i.image = randomizeEdges()
        }
        else if (g4p == 3) {
            self.g4i.image = UIImage(named: "door-open.png")
        }
        else if (g4p == 4) {
            self.g4i.image = UIImage(named: "down-stairs.png")
        }
        else if (g4p == 7) {
            self.g4i.image = UIImage(named: "water.png")
        }
        else if (g4p == 9) {
            self.g4i.image = UIImage(named: "candles.png")
        }
        else if (g4p == 10) {
            self.g4i.image = UIImage(named: "fallen-angel.png")
        }
        else if (g4p == 13) {
            self.g4i.image = UIImage(named: "stockade.png")
        }
        if (g5p == 1) {
            g5i.image = randomizeWalls()
        }
        else if (g5p == 2) {
            g5i.image = randomizeEdges()
        }
        else if (g5p == 3) {
            self.g5i.image = UIImage(named: "door-open.png")
        }
        else if (g5p == 4) {
            self.g5i.image = UIImage(named: "down-stairs.png")
        }
        else if (g5p == 7) {
            self.g5i.image = UIImage(named: "water.png")
        }
        else if (g5p == 9) {
            self.g5i.image = UIImage(named: "candles.png")
        }
        else if (g5p == 10) {
            self.g5i.image = UIImage(named: "fallen-angel.png")
        }
        else if (g5p == 13) {
            self.g5i.image = UIImage(named: "stockade.png")
        }
        if (g6p == 1) {
            g6i.image = randomizeWalls()
        }
        else if (g6p == 2) {
            g6i.image = randomizeEdges()
        }
        else if (g6p == 3) {
            self.g6i.image = UIImage(named: "door-open.png")
        }
        else if (g6p == 4) {
            self.g6i.image = UIImage(named: "down-stairs.png")
        }
        else if (g6p == 7) {
            self.g6i.image = UIImage(named: "water.png")
        }
        else if (g6p == 9) {
            self.g6i.image = UIImage(named: "candles.png")
        }
        else if (g6p == 10) {
            self.g6i.image = UIImage(named: "fallen-angel.png")
        }
        else if (g6p == 13) {
            self.g6i.image = UIImage(named: "stockade.png")
        }
        if (g7p == 1) {
            g7i.image = randomizeWalls()
        }
        else if (g7p == 2) {
            g7i.image = randomizeEdges()
        }
        else if (g7p == 3) {
            self.g7i.image = UIImage(named: "door-open.png")
        }
        else if (g7p == 4) {
            self.g7i.image = UIImage(named: "down-stairs.png")
        }
        else if (g7p == 7) {
            self.g7i.image = UIImage(named: "water.png")
        }
        else if (g7p == 9) {
            self.g7i.image = UIImage(named: "candles.png")
        }
        else if (g7p == 10) {
            self.g7i.image = UIImage(named: "fallen-angel.png")
        }
        else if (g7p == 13) {
            self.g7i.image = UIImage(named: "stockade.png")
        }
        if (g8p == 1) {
            g8i.image = randomizeWalls()
        }
        else if (g8p == 2) {
            g8i.image = randomizeEdges()
        }
        else if (g8p == 3) {
            self.g8i.image = UIImage(named: "door-open.png")
        }
        else if (g8p == 4) {
            self.g8i.image = UIImage(named: "down-stairs.png")
        }
        else if (g8p == 5) {
            self.g8i.image = UIImage(named: "web-lower-right.png")
        }
        else if (g8p == 7) {
            self.g8i.image = UIImage(named: "water.png")
        }
        else if (g8p == 9) {
            self.g8i.image = UIImage(named: "candles.png")
        }
        else if (g8p == 10) {
            self.g8i.image = UIImage(named: "fallen-angel.png")
        }
        else if (g8p == 13) {
            self.g8i.image = UIImage(named: "stockade.png")
        }
        if (g9p == 1) {
            g9i.image = randomizeWalls()
        }
        else if (g9p == 2) {
            g9i.image = randomizeEdges()
        }
        else if (g9p == 3) {
            self.g9i.image = UIImage(named: "door-open.png")
        }
        else if (g9p == 4) {
            self.g9i.image = UIImage(named: "down-stairs.png")
        }
        else if (g9p == 7) {
            self.g9i.image = UIImage(named: "water.png")
        }
        else if (g9p == 9) {
            self.g9i.image = UIImage(named: "candles.png")
        }
        else if (g9p == 10) {
            self.g9i.image = UIImage(named: "fallen-angel.png")
        }
        else if (g9p == 13) {
            self.g9i.image = UIImage(named: "stockade.png")
        }
        
        if (h1p == 1) {
            h1i.image = randomizeWalls()
        }
        else if (h1p == 2) {
            h1i.image = randomizeEdges()
        }
        else if (h1p == 3) {
            self.h1i.image = UIImage(named: "door-open.png")
        }
        else if (h1p == 4) {
            self.h1i.image = UIImage(named: "down-stairs.png")
        }
        else if (h1p == 7) {
            self.h1i.image = UIImage(named: "water.png")
        }
        else if (h1p == 9) {
            self.h1i.image = UIImage(named: "candles.png")
        }
        else if (h1p == 10) {
            self.h1i.image = UIImage(named: "fallen-angel.png")
        }
        else if (h1p == 13) {
            self.h1i.image = UIImage(named: "stockade.png")
        }
        if (h2p == 1) {
            h2i.image = randomizeWalls()
        }
        else if (h2p == 2) {
            h2i.image = randomizeEdges()
        }
        else if (h2p == 3) {
            self.h2i.image = UIImage(named: "door-open.png")
        }
        else if (h2p == 4) {
            self.h2i.image = UIImage(named: "down-stairs.png")
        }
        else if (h2p == 5) {
            self.h2i.image = UIImage(named: "web-lower-left.png")
        }
        else if (h2p == 7) {
            self.h2i.image = UIImage(named: "water.png")
        }
        else if (h2p == 9) {
            self.h2i.image = UIImage(named: "candles.png")
        }
        else if (h2p == 10) {
            self.h2i.image = UIImage(named: "fallen-angel.png")
        }
        else if (h2p == 13) {
            self.h2i.image = UIImage(named: "stockade.png")
        }
        if (h3p == 1) {
            h3i.image = randomizeWalls()
        }
        else if (h3p == 2) {
            h3i.image = randomizeEdges()
        }
        else if (h3p == 3) {
            self.h3i.image = UIImage(named: "door-open.png")
        }
        else if (h3p == 4) {
            self.h3i.image = UIImage(named: "down-stairs.png")
        }
        else if (h3p == 7) {
            self.h3i.image = UIImage(named: "water.png")
        }
        else if (h3p == 9) {
            self.h3i.image = UIImage(named: "candles.png")
        }
        else if (h3p == 10) {
            self.h3i.image = UIImage(named: "fallen-angel.png")
        }
        else if (h3p == 13) {
            self.h3i.image = UIImage(named: "stockade.png")
        }
        if (h4p == 1) {
            h4i.image = randomizeWalls()
        }
        else if (h4p == 2) {
            h4i.image = randomizeEdges()
        }
        else if (h4p == 3) {
            self.h4i.image = UIImage(named: "door-open.png")
        }
        else if (h4p == 4) {
            self.h4i.image = UIImage(named: "down-stairs.png")
        }
        else if (h4p == 7) {
            self.h4i.image = UIImage(named: "water.png")
        }
        else if (h4p == 9) {
            self.h4i.image = UIImage(named: "candles.png")
        }
        else if (h4p == 10) {
            self.h4i.image = UIImage(named: "fallen-angel.png")
        }
        else if (h4p == 13) {
            self.h4i.image = UIImage(named: "stockade.png")
        }
        if (h5p == 1) {
            h5i.image = randomizeWalls()
        }
        else if (h5p == 2) {
            h5i.image = randomizeEdges()
        }
        else if (h5p == 3) {
            self.h5i.image = UIImage(named: "door-open.png")
        }
        else if (h5p == 4) {
            self.h5i.image = UIImage(named: "down-stairs.png")
        }
        else if (h5p == 7) {
            self.h5i.image = UIImage(named: "water.png")
        }
        else if (h5p == 9) {
            self.h5i.image = UIImage(named: "candles.png")
        }
        else if (h5p == 10) {
            self.h5i.image = UIImage(named: "fallen-angel.png")
        }
        else if (h5p == 13) {
            self.h5i.image = UIImage(named: "stockade.png")
        }
        if (h6p == 1) {
            h6i.image = randomizeWalls()
        }
        else if (h6p == 2) {
            h6i.image = randomizeEdges()
        }
        else if (h6p == 3) {
            self.h6i.image = UIImage(named: "door-open.png")
        }
        else if (h6p == 4) {
            self.h6i.image = UIImage(named: "down-stairs.png")
        }
        else if (h6p == 7) {
            self.h6i.image = UIImage(named: "water.png")
        }
        else if (h6p == 9) {
            self.h6i.image = UIImage(named: "candles.png")
        }
        else if (h6p == 10) {
            self.h6i.image = UIImage(named: "fallen-angel.png")
        }
        else if (h6p == 13) {
            self.h6i.image = UIImage(named: "stockade.png")
        }
        if (h7p == 1) {
            h7i.image = randomizeWalls()
        }
        else if (h7p == 2) {
            h7i.image = randomizeEdges()
        }
        else if (h7p == 3) {
            self.h7i.image = UIImage(named: "door-open.png")
        }
        else if (h7p == 4) {
            self.h7i.image = UIImage(named: "down-stairs.png")
        }
        else if (h7p == 7) {
            self.h7i.image = UIImage(named: "water.png")
        }
        else if (h7p == 9) {
            self.h7i.image = UIImage(named: "candles.png")
        }
        else if (h7p == 10) {
            self.h7i.image = UIImage(named: "fallen-angel.png")
        }
        else if (h7p == 13) {
            self.h7i.image = UIImage(named: "stockade.png")
        }
        if (h8p == 1) {
            h8i.image = randomizeWalls()
        }
        else if (h8p == 2) {
            h8i.image = randomizeEdges()
        }
        else if (h8p == 3) {
            self.h8i.image = UIImage(named: "door-open.png")
        }
        else if (h8p == 4) {
            self.h8i.image = UIImage(named: "down-stairs.png")
        }
        else if (h8p == 5) {
            self.h8i.image = UIImage(named: "web-lower-right.png")
        }
        else if (h8p == 7) {
            self.h8i.image = UIImage(named: "water.png")
        }
        else if (h8p == 9) {
            self.h8i.image = UIImage(named: "candles.png")
        }
        else if (h8p == 10) {
            self.h8i.image = UIImage(named: "fallen-angel.png")
        }
        else if (h8p == 13) {
            self.h8i.image = UIImage(named: "stockade.png")
        }
        if (h9p == 1) {
            h9i.image = randomizeWalls()
        }
        else if (h9p == 2) {
            h9i.image = randomizeEdges()
        }
        else if (h9p == 3) {
            self.h9i.image = UIImage(named: "door-open.png")
        }
        else if (h9p == 4) {
            self.h9i.image = UIImage(named: "down-stairs.png")
        }
        else if (h9p == 7) {
            self.h9i.image = UIImage(named: "water.png")
        }
        else if (h9p == 9) {
            self.h9i.image = UIImage(named: "candles.png")
        }
        else if (h9p == 10) {
            self.h9i.image = UIImage(named: "fallen-angel.png")
        }
        else if (h9p == 13) {
            self.h9i.image = UIImage(named: "stockade.png")
        }
    }
    
    func checkObstacles() {
        //set to false initially
        a1o = false
        a2o = false
        a3o = false
        a4o = false
        a5o = false
        a6o = false
        a7o = false
        a8o = false
        a9o = false
        b1o = false
        b2o = false
        b3o = false
        b4o = false
        b5o = false
        b6o = false
        b7o = false
        b8o = false
        b9o = false
        c1o = false
        c2o = false
        c3o = false
        c4o = false
        c5o = false
        c6o = false
        c7o = false
        c8o = false
        c9o = false
        d1o = false
        d2o = false
        d3o = false
        d4o = false
        d5o = false
        d6o = false
        d7o = false
        d8o = false
        d9o = false
        e1o = false
        e2o = false
        e3o = false
        e4o = false
        e5o = false
        e6o = false
        e7o = false
        e8o = false
        e9o = false
        f1o = false
        f2o = false
        f3o = false
        f4o = false
        f5o = false
        f6o = false
        f7o = false
        f8o = false
        f9o = false
        g1o = false
        g2o = false
        g3o = false
        g4o = false
        g5o = false
        g6o = false
        g7o = false
        g8o = false
        g9o = false
        h1o = false
        h2o = false
        h3o = false
        h4o = false
        h5o = false
        h6o = false
        h7o = false
        h8o = false
        h9o = false
        
        if (obs.contains(a1p)) {
            a1o = true
        }
        if (obs.contains(a2p)) {
            a2o = true
        }
        if (obs.contains(a3p)) {
            a3o = true
        }
        if (obs.contains(a4p)) {
            a4o = true
        }
        if (obs.contains(a5p)) {
            a5o = true
        }
        if (obs.contains(a6p)) {
            a6o = true
        }
        if (obs.contains(a7p)) {
            a7o = true
        }
        if (obs.contains(a8p)) {
            a8o = true
        }
        if (obs.contains(a9p)) {
            a9o = true
        }
        if (obs.contains(b1p)) {
            b1o = true
        }
        if (obs.contains(b2p)) {
            b2o = true
        }
        if (obs.contains(b3p)) {
            b3o = true
        }
        if (obs.contains(b4p)) {
            b4o = true
        }
        if (obs.contains(b5p)) {
            b5o = true
        }
        if (obs.contains(b6p)) {
            b6o = true
        }
        if (obs.contains(b7p)) {
            b7o = true
        }
        if (obs.contains(b8p)) {
            b8o = true
        }
        if (obs.contains(b9p)) {
            b9o = true
        }
        if (obs.contains(c1p)) {
            c1o = true
        }
        if (obs.contains(c2p)) {
            c2o = true
        }
        if (obs.contains(c3p)) {
            c3o = true
        }
        if (obs.contains(c4p)) {
            c4o = true
        }
        if (obs.contains(c5p)) {
            c5o = true
        }
        if (obs.contains(c6p)) {
            c6o = true
        }
        if (obs.contains(c7p)) {
            c7o = true
        }
        if (obs.contains(c8p)) {
            c8o = true
        }
        if (obs.contains(c9p)) {
            c9o = true
        }
        if (obs.contains(d1p)) {
            d1o = true
        }
        if (obs.contains(d2p)) {
            d2o = true
        }
        if (obs.contains(d3p)) {
            d3o = true
        }
        if (obs.contains(d4p)) {
            d4o = true
        }
        if (obs.contains(d5p)) {
            d5o = true
        }
        if (obs.contains(d6p)) {
            d6o = true
        }
        if (obs.contains(d7p)) {
            d7o = true
        }
        if (obs.contains(d8p)) {
            d8o = true
        }
        if (obs.contains(d9p)) {
            d9o = true
        }
        if (obs.contains(e1p)) {
            e1o = true
        }
        if (obs.contains(e2p)) {
            e2o = true
        }
        if (obs.contains(e3p)) {
            e3o = true
        }
        if (obs.contains(e4p)) {
            e4o = true
        }
        if (obs.contains(e5p)) {
            e5o = true
        }
        if (obs.contains(e6p)) {
            e6o = true
        }
        if (obs.contains(e7p)) {
            e7o = true
        }
        if (obs.contains(e8p)) {
            e8o = true
        }
        if (obs.contains(e9p)) {
            e9o = true
        }
        if (obs.contains(f1p)) {
            f1o = true
        }
        if (obs.contains(f2p)) {
            f2o = true
        }
        if (obs.contains(f3p)) {
            f3o = true
        }
        if (obs.contains(f4p)) {
            f4o = true
        }
        if (obs.contains(f5p)) {
            f5o = true
        }
        if (obs.contains(f6p)) {
            f6o = true
        }
        if (obs.contains(f7p)) {
            f7o = true
        }
        if (obs.contains(f8p)) {
            f8o = true
        }
        if (obs.contains(f9p)) {
            f9o = true
        }
        if (obs.contains(g1p)) {
            g1o = true
        }
        if (obs.contains(g2p)) {
            g2o = true
        }
        if (obs.contains(g3p)) {
            g3o = true
        }
        if (obs.contains(g4p)) {
            g4o = true
        }
        if (obs.contains(g5p)) {
            g5o = true
        }
        if (obs.contains(g6p)) {
            g6o = true
        }
        if (obs.contains(g7p)) {
            g7o = true
        }
        if (obs.contains(g8p)) {
            g8o = true
        }
        if (obs.contains(g9p)) {
            g9o = true
        }
        if (obs.contains(h1p)) {
            h1o = true
        }
        if (obs.contains(h2p)) {
            h2o = true
        }
        if (obs.contains(h3p)) {
            h3o = true
        }
        if (obs.contains(h4p)) {
            h4o = true
        }
        if (obs.contains(h5p)) {
            h5o = true
        }
        if (obs.contains(h6p)) {
            h6o = true
        }
        if (obs.contains(h7p)) {
            h7o = true
        }
        if (obs.contains(h8p)) {
            h8o = true
        }
        if (obs.contains(h9p)) {
            h9o = true
        }
    }
    
    func checkLocation() {
        //this is going to check the player's current x and y location to determine if they can interact with anything
        
        if (interactions.contains(a1p)) {
            a1x = true
        }
        if (interactions.contains(a2p)) {
            a2x = true
        }
        if (interactions.contains(a3p)) {
            a3x = true
        }
        if (interactions.contains(a4p)) {
            a4x = true
        }
        if (interactions.contains(a5p)) {
            a5x = true
        }
        if (interactions.contains(a6p)) {
            a6x = true
        }
        if (interactions.contains(a7p)) {
            a7x = true
        }
        if (interactions.contains(a8p)) {
            a8x = true
        }
        if (interactions.contains(a9p)) {
            a9x = true
        }
        if (interactions.contains(b1p)) {
            b1x = true
        }
        if (interactions.contains(b2p)) {
            b2x = true
        }
        if (interactions.contains(b3p)) {
            b3x = true
        }
        if (interactions.contains(b4p)) {
            b4x = true
        }
        if (interactions.contains(b5p)) {
            b5x = true
        }
        if (interactions.contains(b6p)) {
            b6x = true
        }
        if (interactions.contains(b7p)) {
            b7x = true
        }
        if (interactions.contains(b8p)) {
            b8x = true
        }
        if (interactions.contains(b9p)) {
            b9x = true
        }
        if (interactions.contains(c1p)) {
            c1x = true
        }
        if (interactions.contains(c2p)) {
            c2x = true
        }
        if (interactions.contains(c3p)) {
            c3x = true
        }
        if (interactions.contains(c4p)) {
            c4x = true
        }
        if (interactions.contains(c5p)) {
            c5x = true
        }
        if (interactions.contains(c6p)) {
            c6x = true
        }
        if (interactions.contains(c7p)) {
            c7x = true
        }
        if (interactions.contains(c8p)) {
            c8x = true
        }
        if (interactions.contains(c9p)) {
            c9x = true
        }
        if (interactions.contains(d1p)) {
            d1x = true
        }
        if (interactions.contains(d2p)) {
            d2x = true
        }
        if (interactions.contains(d3p)) {
            d3x = true
        }
        if (interactions.contains(d4p)) {
            d4x = true
        }
        if (interactions.contains(d5p)) {
            d5x = true
        }
        if (interactions.contains(d6p)) {
            d6x = true
        }
        if (interactions.contains(d7p)) {
            d7x = true
        }
        if (interactions.contains(d8p)) {
            d8x = true
        }
        if (interactions.contains(d9p)) {
            d9x = true
        }
        if (interactions.contains(e1p)) {
            e1x = true
        }
        if (interactions.contains(e2p)) {
            e2x = true
        }
        if (interactions.contains(e3p)) {
            e3x = true
        }
        if (interactions.contains(e4p)) {
            e4x = true
        }
        if (interactions.contains(e5p)) {
            e5x = true
        }
        if (interactions.contains(e6p)) {
            e6x = true
        }
        if (interactions.contains(e7p)) {
            e7x = true
        }
        if (interactions.contains(e8p)) {
            e8x = true
        }
        if (interactions.contains(e9p)) {
            e9x = true
        }
        if (interactions.contains(f1p)) {
            f1x = true
        }
        if (interactions.contains(f2p)) {
            f2x = true
        }
        if (interactions.contains(f3p)) {
            f3x = true
        }
        if (interactions.contains(f4p)) {
            f4x = true
        }
        if (interactions.contains(f5p)) {
            f5x = true
        }
        if (interactions.contains(f6p)) {
            f6x = true
        }
        if (interactions.contains(f7p)) {
            f7x = true
        }
        if (interactions.contains(f8p)) {
            f8x = true
        }
        if (interactions.contains(f9p)) {
            f9x = true
        }
        if (interactions.contains(g1p)) {
            g1x = true
        }
        if (interactions.contains(g2p)) {
            g2x = true
        }
        if (interactions.contains(g3p)) {
            g3x = true
        }
        if (interactions.contains(g4p)) {
            g4x = true
        }
        if (interactions.contains(g5p)) {
            g5x = true
        }
        if (interactions.contains(g6p)) {
            g6x = true
        }
        if (interactions.contains(g7p)) {
            g7x = true
        }
        if (interactions.contains(g8p)) {
            g8x = true
        }
        if (interactions.contains(g9p)) {
            g9x = true
        }
        if (interactions.contains(h1p)) {
            h1x = true
        }
        if (interactions.contains(h2p)) {
            h2x = true
        }
        if (interactions.contains(h3p)) {
            h3x = true
        }
        if (interactions.contains(h4p)) {
            h4x = true
        }
        if (interactions.contains(h5p)) {
            h5x = true
        }
        if (interactions.contains(h6p)) {
            h6x = true
        }
        if (interactions.contains(h7p)) {
            h7x = true
        }
        if (interactions.contains(h8p)) {
            h8x = true
        }
        if (interactions.contains(h9p)) {
            h9x = true
        }
    }
    
    func checkConstraints() {
        //Ok so here's the deal
        //This doesn't need to do a whole lot, it just needs to check if there are walls nearby
        //and disable movement in that direction
        
        canMoveUp = true
        canMoveDown = true
        canMoveLeft = true
        canMoveRight = true
        
        if (playerY == 1) {
            if (playerX == 1) {
                if (a2o == true) {
                    canMoveRight = false
                }
                if (b1o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 2) {
                if (a1o == true) {
                    canMoveLeft = false
                }
                if (a3o == true) {
                    canMoveRight = false
                }
                if (b2o == true) {
                    canMoveDown = false
                }
                
            }
            else if (playerX == 3) {
                if (a2o == true) {
                    canMoveLeft = false
                }
                if (a4o == true) {
                    canMoveRight = false
                }
                if (b3o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 4) {
                if (a3o == true) {
                    canMoveLeft = false
                }
                if (a5o == true) {
                    canMoveRight = false
                }
                if (b4o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 5) {
                if (a4o == true) {
                    canMoveLeft = false
                }
                if (a6o == true) {
                    canMoveRight = false
                }
                if (b5o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 6) {
                if (a5o == true) {
                    canMoveLeft = false
                }
                if (a7o == true) {
                    canMoveRight = false
                }
                if (b6o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 7) {
                if (a6o == true) {
                    canMoveLeft = false
                }
                if (a8o == true) {
                    canMoveRight = false
                }
                if (b7o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 8) {
                if (a7o == true) {
                    canMoveLeft = false
                }
                if (a9o == true) {
                    canMoveRight = false
                }
                if (b8o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 9) {
                if (a8o == true) {
                    canMoveLeft = false
                }
                if (b9o == true) {
                    canMoveDown = false
                }
            }
        }
        if (playerY == 2) {
            if (playerX == 1) {
                if (a1o == true) {
                    canMoveUp = false
                }
                if (b2o == true) {
                    canMoveRight = false
                }
                if (c1o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 2) {
                if (a2o == true) {
                    canMoveUp = false
                }
                if (b1o == true) {
                    canMoveLeft = false
                }
                if (b3o == true) {
                    canMoveRight = false
                }
                if (c2o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 3) {
                if (a3o == true) {
                    canMoveUp = false
                }
                if (b2o == true) {
                    canMoveLeft = false
                }
                if (b4o == true) {
                    canMoveRight = false
                }
                if (c3o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 4) {
                if (a4o == true) {
                    canMoveUp = false
                }
                if (b3o == true) {
                    canMoveLeft = false
                }
                if (b5o == true) {
                    canMoveRight = false
                }
                if (c4o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 5) {
                if (a5o == true) {
                    canMoveUp = false
                }
                if (b4o == true) {
                    canMoveLeft = false
                }
                if (b6o == true) {
                    canMoveRight = false
                }
                if (c5o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 6) {
                if (a6o == true) {
                    canMoveUp = false
                }
                if (b5o == true) {
                    canMoveLeft = false
                }
                if (b7o == true) {
                    canMoveRight = false
                }
                if (c6o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 7) {
                if (a7o == true) {
                    canMoveUp = false
                }
                if (b6o == true) {
                    canMoveLeft = false
                }
                if (b8o == true) {
                    canMoveRight = false
                }
                if (c7o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 8) {
                if (a8o == true) {
                    canMoveUp = false
                }
                if (b7o == true) {
                    canMoveLeft = false
                }
                if (b9o == true) {
                    canMoveRight = false
                }
                if (c8o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 9) {
                if (a9o == true) {
                    canMoveUp = false
                }
                if (b8o == true) {
                    canMoveLeft = false
                }
                if (c9o == true) {
                    canMoveDown = false
                }
            }
        }
        if (playerY == 3) {
            if (playerX == 1) {
                if (b1o == true) {
                    canMoveUp = false
                }
                if (c2o == true) {
                    canMoveRight = false
                }
                if (d1o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 2) {
                if (b2o == true) {
                    canMoveUp = false
                }
                if (c1o == true) {
                    canMoveLeft = false
                }
                if (c3o == true) {
                    canMoveRight = false
                }
                if (d2o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 3) {
                if (b3o == true) {
                    canMoveUp = false
                }
                if (c2o == true) {
                    canMoveLeft = false
                }
                if (c4o == true) {
                    canMoveRight = false
                }
                if (d3o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 4) {
                if (b4o == true) {
                    canMoveUp = false
                }
                if (c3o == true) {
                    canMoveLeft = false
                }
                if (c5o == true) {
                    canMoveRight = false
                }
                if (d4o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 5) {
                if (b5o == true) {
                    canMoveUp = false
                }
                if (c4o == true) {
                    canMoveLeft = false
                }
                if (c6o == true) {
                    canMoveRight = false
                }
                if (d5o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 6) {
                if (b6o == true) {
                    canMoveUp = false
                }
                if (c5o == true) {
                    canMoveLeft = false
                }
                if (c7o == true) {
                    canMoveRight = false
                }
                if (d6o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 7) {
                if (b7o == true) {
                    canMoveUp = false
                }
                if (c6o == true) {
                    canMoveLeft = false
                }
                if (c8o == true) {
                    canMoveRight = false
                }
                if (d7o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 8) {
                if (b8o == true) {
                    canMoveUp = false
                }
                if (c7o == true) {
                    canMoveLeft = false
                }
                if (c9o == true) {
                    canMoveRight = false
                }
                if (d8o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 9) {
                if (b9o == true) {
                    canMoveUp = false
                }
                if (c8o == true) {
                    canMoveLeft = false
                }
                if (d9o == true) {
                    canMoveDown = false
                }
            }
        }
        if (playerY == 4) {
            if (playerX == 1) {
                if (c1o == true) {
                    canMoveUp = false
                }
                if (d2o == true) {
                    canMoveRight = false
                }
                if (e1o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 2) {
                if (c2o == true) {
                    canMoveUp = false
                }
                if (d1o == true) {
                    canMoveLeft = false
                }
                if (d3o == true) {
                    canMoveRight = false
                }
                if (e2o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 3) {
                if (c3o == true) {
                    canMoveUp = false
                }
                if (d2o == true) {
                    canMoveLeft = false
                }
                if (d4o == true) {
                    canMoveRight = false
                }
                if (e3o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 4) {
                if (c4o == true) {
                    canMoveUp = false
                }
                if (d3o == true) {
                    canMoveLeft = false
                }
                if (d5o == true) {
                    canMoveRight = false
                }
                if (e4o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 5) {
                if (c5o == true) {
                    canMoveUp = false
                }
                if (d4o == true) {
                    canMoveLeft = false
                }
                if (d6o == true) {
                    canMoveRight = false
                }
                if (e5o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 6) {
                if (c6o == true) {
                    canMoveUp = false
                }
                if (d5o == true) {
                    canMoveLeft = false
                }
                if (d7o == true) {
                    canMoveRight = false
                }
                if (e6o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 7) {
                if (c7o == true) {
                    canMoveUp = false
                }
                if (d6o == true) {
                    canMoveLeft = false
                }
                if (d8o == true) {
                    canMoveRight = false
                }
                if (e7o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 8) {
                if (c8o == true) {
                    canMoveUp = false
                }
                if (d7o == true) {
                    canMoveLeft = false
                }
                if (d9o == true) {
                    canMoveRight = false
                }
                if (e8o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 9) {
                if (c9o == true) {
                    canMoveUp = false
                }
                if (d8o == true) {
                    canMoveLeft = false
                }
                if (e9o == true) {
                    canMoveDown = false
                }
            }
        }
        if (playerY == 5) {
            if (playerX == 1) {
                if (d1o == true) {
                    canMoveUp = false
                }
                if (e2o == true) {
                    canMoveRight = false
                }
                if (f1o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 2) {
                if (d2o == true) {
                    canMoveUp = false
                }
                if (e1o == true) {
                    canMoveLeft = false
                }
                if (e3o == true) {
                    canMoveRight = false
                }
                if (f2o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 3) {
                if (d3o == true) {
                    canMoveUp = false
                }
                if (e2o == true) {
                    canMoveLeft = false
                }
                if (e4o == true) {
                    canMoveRight = false
                }
                if (f3o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 4) {
                if (d4o == true) {
                    canMoveUp = false
                }
                if (e3o == true) {
                    canMoveLeft = false
                }
                if (e5o == true) {
                    canMoveRight = false
                }
                if (f4o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 5) {
                if (d5o == true) {
                    canMoveUp = false
                }
                if (e4o == true) {
                    canMoveLeft = false
                }
                if (e6o == true) {
                    canMoveRight = false
                }
                if (f5o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 6) {
                if (d6o == true) {
                    canMoveUp = false
                }
                if (e5o == true) {
                    canMoveLeft = false
                }
                if (e7o == true) {
                    canMoveRight = false
                }
                if (f6o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 7) {
                if (d7o == true) {
                    canMoveUp = false
                }
                if (e6o == true) {
                    canMoveLeft = false
                }
                if (e8o == true) {
                    canMoveRight = false
                }
                if (f7o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 8) {
                if (d8o == true) {
                    canMoveUp = false
                }
                if (e7o == true) {
                    canMoveLeft = false
                }
                if (e9o == true) {
                    canMoveRight = false
                }
                if (f8o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 9) {
                if (d9o == true) {
                    canMoveUp = false
                }
                if (e8o == true) {
                    canMoveLeft = false
                }
                if (f9o == true) {
                    canMoveDown = false
                }
            }
        }
        if (playerY == 6) {
            if (playerX == 1) {
                if (e1o == true) {
                    canMoveUp = false
                }
                if (f2o == true) {
                    canMoveRight = false
                }
                if (g1o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 2) {
                if (e2o == true) {
                    canMoveUp = false
                }
                if (f1o == true) {
                    canMoveLeft = false
                }
                if (f3o == true) {
                    canMoveRight = false
                }
                if (g2o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 3) {
                if (e3o == true) {
                    canMoveUp = false
                }
                if (f2o == true) {
                    canMoveLeft = false
                }
                if (f4o == true) {
                    canMoveRight = false
                }
                if (g3o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 4) {
                if (e4o == true) {
                    canMoveUp = false
                }
                if (f3o == true) {
                    canMoveLeft = false
                }
                if (f5o == true) {
                    canMoveRight = false
                }
                if (g4o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 5) {
                if (e5o == true) {
                    canMoveUp = false
                }
                if (f4o == true) {
                    canMoveLeft = false
                }
                if (f6o == true) {
                    canMoveRight = false
                }
                if (g5o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 6) {
                if (e6o == true) {
                    canMoveUp = false
                }
                if (f5o == true) {
                    canMoveLeft = false
                }
                if (f7o == true) {
                    canMoveRight = false
                }
                if (g6o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 7) {
                if (e7o == true) {
                    canMoveUp = false
                }
                if (f6o == true) {
                    canMoveLeft = false
                }
                if (f8o == true) {
                    canMoveRight = false
                }
                if (g7o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 8) {
                if (e8o == true) {
                    canMoveUp = false
                }
                if (f7o == true) {
                    canMoveLeft = false
                }
                if (f9o == true) {
                    canMoveRight = false
                }
                if (g8o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 9) {
                if (e9o == true) {
                    canMoveUp = false
                }
                if (f8o == true) {
                    canMoveLeft = false
                }
                if (g9o == true) {
                    canMoveDown = false
                }
            }
        }
        if (playerY == 7) {
            if (playerX == 1) {
                if (f1o == true) {
                    canMoveUp = false
                }
                if (g2o == true) {
                    canMoveRight = false
                }
                if (h1o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 2) {
                if (f2o == true) {
                    canMoveUp = false
                }
                if (g1o == true) {
                    canMoveLeft = false
                }
                if (g3o == true) {
                    canMoveRight = false
                }
                if (h2o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 3) {
                if (f3o == true) {
                    canMoveUp = false
                }
                if (g2o == true) {
                    canMoveLeft = false
                }
                if (g4o == true) {
                    canMoveRight = false
                }
                if (h3o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 4) {
                if (f4o == true) {
                    canMoveUp = false
                }
                if (g3o == true) {
                    canMoveLeft = false
                }
                if (g5o == true) {
                    canMoveRight = false
                }
                if (h4o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 5) {
                if (f5o == true) {
                    canMoveUp = false
                }
                if (g4o == true) {
                    canMoveLeft = false
                }
                if (g6o == true) {
                    canMoveRight = false
                }
                if (h5o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 6) {
                if (f6o == true) {
                    canMoveUp = false
                }
                if (g5o == true) {
                    canMoveLeft = false
                }
                if (g7o == true) {
                    canMoveRight = false
                }
                if (h6o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 7) {
                if (f7o == true) {
                    canMoveUp = false
                }
                if (g6o == true) {
                    canMoveLeft = false
                }
                if (g8o == true) {
                    canMoveRight = false
                }
                if (h7o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 8) {
                if (f8o == true) {
                    canMoveUp = false
                }
                if (g7o == true) {
                    canMoveLeft = false
                }
                if (g9o == true) {
                    canMoveRight = false
                }
                if (h8o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 9) {
                if (f9o == true) {
                    canMoveUp = false
                }
                if (g8o == true) {
                    canMoveLeft = false
                }
                if (h9o == true) {
                    canMoveDown = false
                }
            }
        }
        if (playerY == 8) {
            if (playerX == 1) {
                if (h2o == true) {
                    canMoveRight = false
                }
                if (g1o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 2) {
                if (h1o == true) {
                    canMoveLeft = false
                }
                if (h3o == true) {
                    canMoveRight = false
                }
                if (g2o == true) {
                    canMoveDown = false
                }
                
            }
            else if (playerX == 3) {
                if (h2o == true) {
                    canMoveLeft = false
                }
                if (h4o == true) {
                    canMoveRight = false
                }
                if (g3o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 4) {
                if (h3o == true) {
                    canMoveLeft = false
                }
                if (h5o == true) {
                    canMoveRight = false
                }
                if (g4o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 5) {
                if (h4o == true) {
                    canMoveLeft = false
                }
                if (h6o == true) {
                    canMoveRight = false
                }
                if (g5o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 6) {
                if (h5o == true) {
                    canMoveLeft = false
                }
                if (h7o == true) {
                    canMoveRight = false
                }
                if (g6o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 7) {
                if (h6o == true) {
                    canMoveLeft = false
                }
                if (h8o == true) {
                    canMoveRight = false
                }
                if (g7o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 8) {
                if (h7o == true) {
                    canMoveLeft = false
                }
                if (h9o == true) {
                    canMoveRight = false
                }
                if (g8o == true) {
                    canMoveDown = false
                }
            }
            else if (playerX == 9) {
                if (h8o == true) {
                    canMoveLeft = false
                }
                if (g9o == true) {
                    canMoveDown = false
                }
            }
        }
    }
    
    func checkEnemyEncounter() {
        if (en1x == playerX) {
            if ((en1y - playerY) == 1 || (playerY - en1y) == 1) {
                en1e = true
                enemyEncounter()
            }
        }
        else if (en1y == playerY) {
            if ((en1x - playerX) == 1 || (playerX - en1x) == 1) {
                en1e = true
                enemyEncounter()
            }
        }
    }
    
    func enemyEncounter() {
        self.gridView.shake()
        moveEnabled = false
        playerHealth = playerHealth - 1
        if (playerHealth > 0) {
            let triggerTime = (Int64(NSEC_PER_SEC) * 1)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(triggerTime) / Double(NSEC_PER_SEC), execute: { () -> Void in
                self.revealMessage()
            })
        }
        else {
            self.player.image = UIImage(named: "body.png")
            let triggerTime = (Int64(NSEC_PER_SEC) * 1)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(triggerTime) / Double(NSEC_PER_SEC), execute: { () -> Void in
                self.revealEnd()
            })
        }
        killEnemy()
    }
    
    func revealMessage() {
        UIView.animate(withDuration: animationSpeed, animations: {
            self.messageView.alpha = 1
        }) 
    }
    
    func revealEnd() {
        UIView.animate(withDuration: animationSpeed, animations: {
            self.endView.alpha = 1
        }) 
    }
    
    func killEnemy() {
        en1h = 0
        UIView.animate(withDuration: animationSpeed, animations: {
            self.en1i.alpha = 0
        }) 
    }
    
    func checkEnemyConstraints() {
        enemyCanMoveUp = true
        enemyCanMoveDown = true
        enemyCanMoveLeft = true
        enemyCanMoveRight = true
        
        if (en1y == 1) {
            if (en1x == 1) {
                if (a2o == true) {
                    enemyCanMoveRight = false
                }
                if (b1o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 2) {
                if (a1o == true) {
                    enemyCanMoveLeft = false
                }
                if (a3o == true) {
                    enemyCanMoveRight = false
                }
                if (b2o == true) {
                    enemyCanMoveDown = false
                }
                
            }
            else if (en1x == 3) {
                if (a2o == true) {
                    enemyCanMoveLeft = false
                }
                if (a4o == true) {
                    enemyCanMoveRight = false
                }
                if (b3o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 4) {
                if (a3o == true) {
                    enemyCanMoveLeft = false
                }
                if (a5o == true) {
                    enemyCanMoveRight = false
                }
                if (b4o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 5) {
                if (a4o == true) {
                    enemyCanMoveLeft = false
                }
                if (a6o == true) {
                    enemyCanMoveRight = false
                }
                if (b5o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 6) {
                if (a5o == true) {
                    enemyCanMoveLeft = false
                }
                if (a7o == true) {
                    enemyCanMoveRight = false
                }
                if (b6o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 7) {
                if (a6o == true) {
                    enemyCanMoveLeft = false
                }
                if (a8o == true) {
                    enemyCanMoveRight = false
                }
                if (b7o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 8) {
                if (a7o == true) {
                    enemyCanMoveLeft = false
                }
                if (a9o == true) {
                    enemyCanMoveRight = false
                }
                if (b8o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 9) {
                if (a8o == true) {
                    enemyCanMoveLeft = false
                }
                if (b9o == true) {
                    enemyCanMoveDown = false
                }
            }
        }
        if (en1y == 2) {
            if (en1x == 1) {
                if (a1o == true) {
                    enemyCanMoveUp = false
                }
                if (b2o == true) {
                    enemyCanMoveRight = false
                }
                if (c1o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 2) {
                if (a2o == true) {
                    enemyCanMoveUp = false
                }
                if (b1o == true) {
                    enemyCanMoveLeft = false
                }
                if (b3o == true) {
                    enemyCanMoveRight = false
                }
                if (c2o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 3) {
                if (a3o == true) {
                    enemyCanMoveUp = false
                }
                if (b2o == true) {
                    enemyCanMoveLeft = false
                }
                if (b4o == true) {
                    enemyCanMoveRight = false
                }
                if (c3o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 4) {
                if (a4o == true) {
                    enemyCanMoveUp = false
                }
                if (b3o == true) {
                    enemyCanMoveLeft = false
                }
                if (b5o == true) {
                    enemyCanMoveRight = false
                }
                if (c4o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 5) {
                if (a5o == true) {
                    enemyCanMoveUp = false
                }
                if (b4o == true) {
                    enemyCanMoveLeft = false
                }
                if (b6o == true) {
                    enemyCanMoveRight = false
                }
                if (c5o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 6) {
                if (a6o == true) {
                    enemyCanMoveUp = false
                }
                if (b5o == true) {
                    enemyCanMoveLeft = false
                }
                if (b7o == true) {
                    enemyCanMoveRight = false
                }
                if (c6o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 7) {
                if (a7o == true) {
                    enemyCanMoveUp = false
                }
                if (b6o == true) {
                    enemyCanMoveLeft = false
                }
                if (b8o == true) {
                    enemyCanMoveRight = false
                }
                if (c7o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 8) {
                if (a8o == true) {
                    enemyCanMoveUp = false
                }
                if (b7o == true) {
                    enemyCanMoveLeft = false
                }
                if (b9o == true) {
                    enemyCanMoveRight = false
                }
                if (c8o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 9) {
                if (a9o == true) {
                    enemyCanMoveUp = false
                }
                if (b8o == true) {
                    enemyCanMoveLeft = false
                }
                if (c9o == true) {
                    enemyCanMoveDown = false
                }
            }
        }
        if (en1y == 3) {
            if (en1x == 1) {
                if (b1o == true) {
                    enemyCanMoveUp = false
                }
                if (c2o == true) {
                    enemyCanMoveRight = false
                }
                if (d1o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 2) {
                if (b2o == true) {
                    enemyCanMoveUp = false
                }
                if (c1o == true) {
                    enemyCanMoveLeft = false
                }
                if (c3o == true) {
                    enemyCanMoveRight = false
                }
                if (d2o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 3) {
                if (b3o == true) {
                    enemyCanMoveUp = false
                }
                if (c2o == true) {
                    enemyCanMoveLeft = false
                }
                if (c4o == true) {
                    enemyCanMoveRight = false
                }
                if (d3o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 4) {
                if (b4o == true) {
                    enemyCanMoveUp = false
                }
                if (c3o == true) {
                    enemyCanMoveLeft = false
                }
                if (c5o == true) {
                    enemyCanMoveRight = false
                }
                if (d4o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 5) {
                if (b5o == true) {
                    enemyCanMoveUp = false
                }
                if (c4o == true) {
                    enemyCanMoveLeft = false
                }
                if (c6o == true) {
                    enemyCanMoveRight = false
                }
                if (d5o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 6) {
                if (b6o == true) {
                    enemyCanMoveUp = false
                }
                if (c5o == true) {
                    enemyCanMoveLeft = false
                }
                if (c7o == true) {
                    enemyCanMoveRight = false
                }
                if (d6o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 7) {
                if (b7o == true) {
                    enemyCanMoveUp = false
                }
                if (c6o == true) {
                    enemyCanMoveLeft = false
                }
                if (c8o == true) {
                    enemyCanMoveRight = false
                }
                if (d7o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 8) {
                if (b8o == true) {
                    enemyCanMoveUp = false
                }
                if (c7o == true) {
                    enemyCanMoveLeft = false
                }
                if (c9o == true) {
                    enemyCanMoveRight = false
                }
                if (d8o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 9) {
                if (b9o == true) {
                    enemyCanMoveUp = false
                }
                if (c8o == true) {
                    enemyCanMoveLeft = false
                }
                if (d9o == true) {
                    enemyCanMoveDown = false
                }
            }
        }
        if (en1y == 4) {
            if (en1x == 1) {
                if (c1o == true) {
                    enemyCanMoveUp = false
                }
                if (d2o == true) {
                    enemyCanMoveRight = false
                }
                if (e1o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 2) {
                if (c2o == true) {
                    enemyCanMoveUp = false
                }
                if (d1o == true) {
                    enemyCanMoveLeft = false
                }
                if (d3o == true) {
                    enemyCanMoveRight = false
                }
                if (e2o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 3) {
                if (c3o == true) {
                    enemyCanMoveUp = false
                }
                if (d2o == true) {
                    enemyCanMoveLeft = false
                }
                if (d4o == true) {
                    enemyCanMoveRight = false
                }
                if (e3o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 4) {
                if (c4o == true) {
                    enemyCanMoveUp = false
                }
                if (d3o == true) {
                    enemyCanMoveLeft = false
                }
                if (d5o == true) {
                    enemyCanMoveRight = false
                }
                if (e4o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 5) {
                if (c5o == true) {
                    enemyCanMoveUp = false
                }
                if (d4o == true) {
                    enemyCanMoveLeft = false
                }
                if (d6o == true) {
                    enemyCanMoveRight = false
                }
                if (e5o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 6) {
                if (c6o == true) {
                    enemyCanMoveUp = false
                }
                if (d5o == true) {
                    enemyCanMoveLeft = false
                }
                if (d7o == true) {
                    enemyCanMoveRight = false
                }
                if (e6o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 7) {
                if (c7o == true) {
                    enemyCanMoveUp = false
                }
                if (d6o == true) {
                    enemyCanMoveLeft = false
                }
                if (d8o == true) {
                    enemyCanMoveRight = false
                }
                if (e7o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 8) {
                if (c8o == true) {
                    enemyCanMoveUp = false
                }
                if (d7o == true) {
                    enemyCanMoveLeft = false
                }
                if (d9o == true) {
                    enemyCanMoveRight = false
                }
                if (e8o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 9) {
                if (c9o == true) {
                    enemyCanMoveUp = false
                }
                if (d8o == true) {
                    enemyCanMoveLeft = false
                }
                if (e9o == true) {
                    enemyCanMoveDown = false
                }
            }
        }
        if (en1y == 5) {
            if (en1x == 1) {
                if (d1o == true) {
                    enemyCanMoveUp = false
                }
                if (e2o == true) {
                    enemyCanMoveRight = false
                }
                if (f1o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 2) {
                if (d2o == true) {
                    enemyCanMoveUp = false
                }
                if (e1o == true) {
                    enemyCanMoveLeft = false
                }
                if (e3o == true) {
                    enemyCanMoveRight = false
                }
                if (f2o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 3) {
                if (d3o == true) {
                    enemyCanMoveUp = false
                }
                if (e2o == true) {
                    enemyCanMoveLeft = false
                }
                if (e4o == true) {
                    enemyCanMoveRight = false
                }
                if (f3o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 4) {
                if (d4o == true) {
                    enemyCanMoveUp = false
                }
                if (e3o == true) {
                    enemyCanMoveLeft = false
                }
                if (e5o == true) {
                    enemyCanMoveRight = false
                }
                if (f4o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 5) {
                if (d5o == true) {
                    enemyCanMoveUp = false
                }
                if (e4o == true) {
                    enemyCanMoveLeft = false
                }
                if (e6o == true) {
                    enemyCanMoveRight = false
                }
                if (f5o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 6) {
                if (d6o == true) {
                    enemyCanMoveUp = false
                }
                if (e5o == true) {
                    enemyCanMoveLeft = false
                }
                if (e7o == true) {
                    enemyCanMoveRight = false
                }
                if (f6o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 7) {
                if (d7o == true) {
                    enemyCanMoveUp = false
                }
                if (e6o == true) {
                    enemyCanMoveLeft = false
                }
                if (e8o == true) {
                    enemyCanMoveRight = false
                }
                if (f7o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 8) {
                if (d8o == true) {
                    enemyCanMoveUp = false
                }
                if (e7o == true) {
                    enemyCanMoveLeft = false
                }
                if (e9o == true) {
                    enemyCanMoveRight = false
                }
                if (f8o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 9) {
                if (d9o == true) {
                    enemyCanMoveUp = false
                }
                if (e8o == true) {
                    enemyCanMoveLeft = false
                }
                if (f9o == true) {
                    enemyCanMoveDown = false
                }
            }
        }
        if (en1y == 6) {
            if (en1x == 1) {
                if (e1o == true) {
                    enemyCanMoveUp = false
                }
                if (f2o == true) {
                    enemyCanMoveRight = false
                }
                if (g1o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 2) {
                if (e2o == true) {
                    enemyCanMoveUp = false
                }
                if (f1o == true) {
                    enemyCanMoveLeft = false
                }
                if (f3o == true) {
                    enemyCanMoveRight = false
                }
                if (g2o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 3) {
                if (e3o == true) {
                    enemyCanMoveUp = false
                }
                if (f2o == true) {
                    enemyCanMoveLeft = false
                }
                if (f4o == true) {
                    enemyCanMoveRight = false
                }
                if (g3o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 4) {
                if (e4o == true) {
                    enemyCanMoveUp = false
                }
                if (f3o == true) {
                    enemyCanMoveLeft = false
                }
                if (f5o == true) {
                    enemyCanMoveRight = false
                }
                if (g4o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 5) {
                if (e5o == true) {
                    enemyCanMoveUp = false
                }
                if (f4o == true) {
                    enemyCanMoveLeft = false
                }
                if (f6o == true) {
                    enemyCanMoveRight = false
                }
                if (g5o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 6) {
                if (e6o == true) {
                    enemyCanMoveUp = false
                }
                if (f5o == true) {
                    enemyCanMoveLeft = false
                }
                if (f7o == true) {
                    enemyCanMoveRight = false
                }
                if (g6o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 7) {
                if (e7o == true) {
                    enemyCanMoveUp = false
                }
                if (f6o == true) {
                    enemyCanMoveLeft = false
                }
                if (f8o == true) {
                    enemyCanMoveRight = false
                }
                if (g7o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 8) {
                if (e8o == true) {
                    enemyCanMoveUp = false
                }
                if (f7o == true) {
                    enemyCanMoveLeft = false
                }
                if (f9o == true) {
                    enemyCanMoveRight = false
                }
                if (g8o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 9) {
                if (e9o == true) {
                    enemyCanMoveUp = false
                }
                if (f8o == true) {
                    enemyCanMoveLeft = false
                }
                if (g9o == true) {
                    enemyCanMoveDown = false
                }
            }
        }
        if (en1y == 7) {
            if (en1x == 1) {
                if (f1o == true) {
                    enemyCanMoveUp = false
                }
                if (g2o == true) {
                    enemyCanMoveRight = false
                }
                if (h1o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 2) {
                if (f2o == true) {
                    enemyCanMoveUp = false
                }
                if (g1o == true) {
                    enemyCanMoveLeft = false
                }
                if (g3o == true) {
                    enemyCanMoveRight = false
                }
                if (h2o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 3) {
                if (f3o == true) {
                    enemyCanMoveUp = false
                }
                if (g2o == true) {
                    enemyCanMoveLeft = false
                }
                if (g4o == true) {
                    enemyCanMoveRight = false
                }
                if (h3o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 4) {
                if (f4o == true) {
                    enemyCanMoveUp = false
                }
                if (g3o == true) {
                    enemyCanMoveLeft = false
                }
                if (g5o == true) {
                    enemyCanMoveRight = false
                }
                if (h4o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 5) {
                if (f5o == true) {
                    enemyCanMoveUp = false
                }
                if (g4o == true) {
                    enemyCanMoveLeft = false
                }
                if (g6o == true) {
                    enemyCanMoveRight = false
                }
                if (h5o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 6) {
                if (f6o == true) {
                    enemyCanMoveUp = false
                }
                if (g5o == true) {
                    enemyCanMoveLeft = false
                }
                if (g7o == true) {
                    enemyCanMoveRight = false
                }
                if (h6o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 7) {
                if (f7o == true) {
                    enemyCanMoveUp = false
                }
                if (g6o == true) {
                    enemyCanMoveLeft = false
                }
                if (g8o == true) {
                    enemyCanMoveRight = false
                }
                if (h7o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 8) {
                if (f8o == true) {
                    enemyCanMoveUp = false
                }
                if (g7o == true) {
                    enemyCanMoveLeft = false
                }
                if (g9o == true) {
                    enemyCanMoveRight = false
                }
                if (h8o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 9) {
                if (f9o == true) {
                    enemyCanMoveUp = false
                }
                if (g8o == true) {
                    enemyCanMoveLeft = false
                }
                if (h9o == true) {
                    enemyCanMoveDown = false
                }
            }
        }
        if (en1y == 8) {
            if (en1x == 1) {
                if (h2o == true) {
                    enemyCanMoveRight = false
                }
                if (g1o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 2) {
                if (h1o == true) {
                    enemyCanMoveLeft = false
                }
                if (h3o == true) {
                    enemyCanMoveRight = false
                }
                if (g2o == true) {
                    enemyCanMoveDown = false
                }
                
            }
            else if (en1x == 3) {
                if (h2o == true) {
                    enemyCanMoveLeft = false
                }
                if (h4o == true) {
                    enemyCanMoveRight = false
                }
                if (g3o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 4) {
                if (h3o == true) {
                    enemyCanMoveLeft = false
                }
                if (h5o == true) {
                    enemyCanMoveRight = false
                }
                if (g4o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 5) {
                if (h4o == true) {
                    enemyCanMoveLeft = false
                }
                if (h6o == true) {
                    enemyCanMoveRight = false
                }
                if (g5o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 6) {
                if (h5o == true) {
                    enemyCanMoveLeft = false
                }
                if (h7o == true) {
                    enemyCanMoveRight = false
                }
                if (g6o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 7) {
                if (h6o == true) {
                    enemyCanMoveLeft = false
                }
                if (h8o == true) {
                    enemyCanMoveRight = false
                }
                if (g7o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 8) {
                if (h7o == true) {
                    enemyCanMoveLeft = false
                }
                if (h9o == true) {
                    enemyCanMoveRight = false
                }
                if (g8o == true) {
                    enemyCanMoveDown = false
                }
            }
            else if (en1x == 9) {
                if (h8o == true) {
                    enemyCanMoveLeft = false
                }
                if (g9o == true) {
                    enemyCanMoveDown = false
                }
            }
        }
    }
    
    func checkEnemyPriority() {
        enemyPriorityUp = false
        enemyPriorityDown = false
        enemyPriorityLeft = false
        enemyPriorityRight = false
        
        if (en1y == playerY) {
            if (en1x > playerX && enemyCanMoveLeft == true) {
                enemyPriorityLeft = true
            }
            else if (en1x < playerX && enemyCanMoveRight == true) {
                enemyPriorityRight = true
            }
        }
        else if (en1x == playerX) {
            if (en1y < playerY && enemyCanMoveDown == true) {
                enemyPriorityDown = true
            }
            else if (en1y > playerY && enemyCanMoveUp == true) {
                enemyPriorityUp = true
            }
        }
    }
    
    @IBAction func swipeUp(_ sender: AnyObject) {
        if (moveEnabled == true) {
            moveUp()
        }
    }
    
    @IBAction func swipeDown(_ sender: AnyObject) {
        if (moveEnabled == true) {
            moveDown()
        }
    }
    
    @IBAction func swipeLeft(_ sender: AnyObject) {
        if (moveEnabled == true) {
            moveLeft()
        }
    }
    
    @IBAction func swipeRight(_ sender: AnyObject) {
        if (moveEnabled == true) {
            moveRight()
        }
    }
    
    func moveDown() {
        checkConstraints()
        if (playerY < boundsY && canMoveDown == true) {
            playerY += 1
            UIView.animate(withDuration: animationSpeed, animations: {
                self.player.center = CGPoint(x: self.player.center.x, y: self.player.center.y + 48)
            }) 
            
            endTurn()
        }
    }
    
    func moveUp() {
        checkConstraints()
        if (playerY > 1 && canMoveUp == true) {
            playerY -= 1
            UIView.animate(withDuration: animationSpeed, animations: {
                self.player.center = CGPoint(x: self.player.center.x, y: self.player.center.y - 48)
            }) 
            
            endTurn()
        }
    }
    
    func moveLeft() {
        checkConstraints()
        if (playerX > 1 && canMoveLeft == true) {
            playerX -= 1
            UIView.animate(withDuration: animationSpeed, animations: {
                self.player.center = CGPoint(x: self.player.center.x - 32, y: self.player.center.y)
            }) 
            
            endTurn()
        }
    }
    
    func moveRight() {
        checkConstraints()
        if (playerX < boundsX && canMoveRight == true) {
            playerX += 1
            UIView.animate(withDuration: animationSpeed, animations: {
                self.player.center = CGPoint(x: self.player.center.x + 32, y: self.player.center.y)
            }) 
            
            endTurn()
        }
    }
    
    func moveEnemy() {
        if (enemyPriorityUp == true && en1y > 1 && enemyCanMoveUp == true) {
            en1y -= 1
            UIView.animate(withDuration: animationSpeed, animations: {
                self.en1i.center = CGPoint(x: self.en1i.center.x, y: self.en1i.center.y - 48)
            }) 
            temp = temp - 1
        }
        else if (enemyPriorityDown == true && en1y < boundsY && enemyCanMoveDown == true) {
            en1y += 1
            UIView.animate(withDuration: animationSpeed, animations: {
                self.en1i.center = CGPoint(x: self.en1i.center.x, y: self.en1i.center.y + 48)
            }) 
            temp = temp - 1
        }
        else if (enemyPriorityLeft == true && en1x > 1 && enemyCanMoveLeft == true) {
            en1x -= 1
            UIView.animate(withDuration: animationSpeed, animations: {
                self.en1i.center = CGPoint(x: self.en1i.center.x - 32, y: self.en1i.center.y)
            }) 
            temp = temp - 1
        }
        else if (enemyPriorityRight == true && en1x < boundsX && enemyCanMoveRight == true) {
            en1x += 1
            UIView.animate(withDuration: animationSpeed, animations: {
                self.en1i.center = CGPoint(x: self.en1i.center.x + 32, y: self.en1i.center.y)
            }) 
            temp = temp - 1
        }
        else {
            //at this point if the enemy has no priority randomize the movement
            let tempspec = arc4random() % 4
            
            if (tempspec == 0) {
                if (en1y < boundsY && enemyCanMoveDown == true) {
                    en1y += 1
                    UIView.animate(withDuration: animationSpeed, animations: {
                        self.en1i.center = CGPoint(x: self.en1i.center.x, y: self.en1i.center.y + 48)
                    }) 
                    temp = temp - 1
                }
            }
            if (tempspec == 1) {
                if (en1y > 1 && enemyCanMoveUp == true) {
                    en1y -= 1
                    UIView.animate(withDuration: animationSpeed, animations: {
                        self.en1i.center = CGPoint(x: self.en1i.center.x, y: self.en1i.center.y - 48)
                    }) 
                    temp = temp - 1
                }
            }
            if (tempspec == 2) {
                if (en1x > 1 && enemyCanMoveLeft == true) {
                    en1x -= 1
                    UIView.animate(withDuration: animationSpeed, animations: {
                        self.en1i.center = CGPoint(x: self.en1i.center.x - 32, y: self.en1i.center.y)
                    }) 
                    temp = temp - 1
                }
            }
            if (tempspec == 3) {
                if (en1x < boundsX && enemyCanMoveRight == true) {
                    en1x += 1
                    UIView.animate(withDuration: animationSpeed, animations: {
                        self.en1i.center = CGPoint(x: self.en1i.center.x + 32, y: self.en1i.center.y)
                    }) 
                    temp = temp - 1
                }
            }
        }
        
        checkEnemyEncounter()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.hsLabel.font = UIFont(name: "Kharon4av01", size: 16)
        self.embarkLabel.font = UIFont(name: "Kharon4av01", size: 16)
        self.titleLabel.font = UIFont(name: "Kharon4av01", size: 32)
        self.musicToggleLabel.font = UIFont(name: "Kharon4av01", size: 16)
        self.needHelpLabel.font = UIFont(name: "Kharon4av01", size: 16)
        self.messageText.font = UIFont(name: "Kharon4av01", size: 16)
        
        self.messageView.alpha = 0
        self.relicView.alpha = 0
        self.endView.alpha = 0
        
        generateNew()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
