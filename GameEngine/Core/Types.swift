//
//  Types.swift
//  GameEngine
//
//  Created by Jacob Hoffman on 8/20/21.
//

import simd

protocol Sizeable {
    static func size(_ count: Int) -> Int
    static func stride(_ count: Int) -> Int
}

extension Sizeable {
    static func size() -> Int {
        return MemoryLayout<Self>.size
    }
    
    static func size(_ count: Int) -> Int {
        return MemoryLayout<Self>.size * count
    }
    
    static func stride() -> Int {
        return MemoryLayout<Self>.stride
    }
    
    static func stride(_ count: Int) -> Int {
        return MemoryLayout<Self>.stride * count
    }
}

extension SIMD3: Sizeable { }

struct Vertex: Sizeable {
    var position: SIMD3<Float>
    var color: SIMD4<Float>
}
