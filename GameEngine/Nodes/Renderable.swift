//
//  Renderable.swift
//  GameEngine
//
//  Created by Jacob Hoffman on 8/23/21.
//

import MetalKit

protocol Renderable {
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder)
}
