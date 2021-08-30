//
//  Mesh.swift
//  GameEngine
//
//  Created by Jacob Hoffman on 8/22/21.
//

import MetalKit

protocol Mesh {
    var vertexBuffer: MTLBuffer! { get }
    var vertexCount: Int! { get }
}

class CustomMesh: Mesh {
    var vertexBuffer: MTLBuffer!
    var vertexCount: Int! {
        return vertices.count
    }
    
    var vertices: [Vertex]!
    
    init() { }

    func createBuffers() {
        vertexBuffer = Engine.device.makeBuffer(bytes: vertices, length: Vertex.stride() * vertices.count, options: [])
    }
}

class Triangle_CustomMesh: CustomMesh {
    
    override init() {
        super.init()
        createVerticesRGBTriangle()
        createBuffers()
    }
    
    func createVerticesRGBTriangle() {
        vertices = [
            Vertex(position: SIMD3<Float>(0,1,0), color: SIMD4<Float>(1,0,0,1)),
            Vertex(position: SIMD3<Float>(-1,-1,0), color: SIMD4<Float>(0,1,0,1)),
            Vertex(position: SIMD3<Float>(1,-1,0), color: SIMD4<Float>(0,0,1,1))
        ]
    }
}

class Quad_CustomMesh: CustomMesh {
    
    override init() {
        super.init()
        createVerticesRGBQuad()
        createBuffers()
    }
    
    func createVerticesRGBQuad() {
        vertices = [
            Vertex(position: SIMD3<Float>(0.5,0.5,0), color: SIMD4<Float>(1,0,0,1)), //top-right
            Vertex(position: SIMD3<Float>(-0.5,0.5,0), color: SIMD4<Float>(0,1,0,1)), //top-left
            Vertex(position: SIMD3<Float>(-0.5,-0.5,0), color: SIMD4<Float>(0,0,1,1)), //bottom-left
            
            Vertex(position: SIMD3<Float>(0.5,0.5,0), color: SIMD4<Float>(1,0,0,1)), //top-right
            Vertex(position: SIMD3<Float>(-0.5,-0.5,0), color: SIMD4<Float>(0,0,1,1)), //bottom-left
            Vertex(position: SIMD3<Float>(0.5,-0.5,0), color: SIMD4<Float>(1,0,1,1)) //bottom-right
        ]
    }
    
}
