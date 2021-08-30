//
//  Shaders.metal
//  GameEngine
//
//  Created by Jacob Hoffman on 8/19/21.
//

#include <metal_stdlib>
using namespace metal;

struct VertexIn {
    float3 position [[ attribute(0) ]];
    float4 color [[ attribute(1) ]];
};

struct RasterizerData {
    float4 position [[ position ]];
    float4 color;
};

vertex RasterizerData vertex_shader(const VertexIn input [[ stage_in ]]) {
    RasterizerData output;
    output.position = float4(input.position, 1);
    output.color = input.color;
    
    return output;
}

fragment half4 fragment_shader(RasterizerData input [[ stage_in ]]) {
    float4 color = input.color;
    
    return half4(color.r, color.g, color.b, color.a);
}
