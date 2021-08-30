//
//  GameObject.swift
//  GameEngine
//
//  Created by Jacob Hoffman on 8/20/21.
//

import MetalKit

class GameObject: Node {

    var modelConstants = ModelConstants()
    var mesh: Mesh
    
    var time: Float = 0
    
    init(_ meshType: MeshTypes) {
        self.mesh = MeshLibrary.Mesh(meshType)
    }
    
    override func update(deltaTime: Float) {
        // time += deltaTime
        // print("time = \(time)")
        
        // self.rotation.z = -atan2f(Mouse.GetMouseViewportPosition().x, Mouse.GetMouseViewportPosition().y)
        // self.position.y = cos(time)
        // self.scale = SIMD3<Float>(repeating: cos(time))/2
        // self.rotation.z += time/2
        
        updateModelConstants()
    }
    
    private func updateModelConstants() {
        modelConstants.modelMatrix = self.modelMatrix   // self refers to the node's modelMatrix
    }

}

extension GameObject: Renderable {
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.setVertexBytes(&modelConstants, length: ModelConstants.stride(), index: 1)
        renderCommandEncoder.setRenderPipelineState(RenderPipelineStateLibrary.PipelineState(.Basic))
        renderCommandEncoder.setVertexBuffer(mesh.vertexBuffer, offset: 0, index: 0)
        renderCommandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: mesh.vertexCount)
    }
}
