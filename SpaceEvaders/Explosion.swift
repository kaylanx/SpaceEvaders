//
//  Explosion.swift
//  SpaceEvaders
//
//  Created by Tristen Miller on 1/7/15.
//  Copyright (c) 2015 Tristen Miller. All rights reserved.
//

import SpriteKit

class Explosion : Sprite {
    init(x: CGFloat, y: CGFloat) {
        super.init(imageNamed: "shockwave", name: "bm", x: x, y: y)
    }
    
    func boom(main: GameScene) {
        let explode = SKEmitterNode(fileNamed: "Explode.sks")
        sprite.addChild(explode)
        sprite.runAction(
            SKAction.sequence([
                SKAction.scaleBy(7, duration: 0.5),
                SKAction.runBlock({self.removeAliens(main)}),
                SKAction.fadeAlphaBy(-0.9, duration: 0.6),
                SKAction.removeFromParent()
            ])
        )
    }
    
    func removeAliens(main: GameScene) {
        for alien in main.aliens {
            let alien = alien as Alien
            if (!alien.isDisabled() && !main.isGameOver) {
                main.scoreboard.addScore(1)
            }
            main.aliens.removeObject(alien)
            alien.sprite.removeFromParent()
        }
    }
}
