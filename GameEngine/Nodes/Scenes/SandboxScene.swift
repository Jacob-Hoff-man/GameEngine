//
//  SandboxScene.swift
//  GameEngine
//
//  Created by Jacob Hoffman on 8/24/21.
//

import MetalKit

class SandboxScene: Scene {
    
    override func buildScene() {
        
        //generating gameObjs in a 2nx2n array to display
        let n = 25
        for y in -n ..< n {
            for x in -n ..< n {
                    
                let gameObj = AimingTriangle()
                
                // offset rotation of each column of gameObjs
                // gameObj.time = Float(x)

                // set the gameObj in specific location in 5x5 array
                gameObj.position.y = (Float(y) + 0.5) / Float(n)
                gameObj.position.x = (Float(x) + 0.5) / Float(n)

                // scale object
                gameObj.scale = SIMD3<Float>(repeating: 0.1)

                // individual obj update handled at the object level, not the scene level
                
                // add to scene graph
                addChild(gameObj)
                
            }
        }
        
    }
    
}
