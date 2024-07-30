//
//  BasicShapes.metal
//  SwiftUIShaders
//
//  Created by Maciej Sienkiewicz on 30/07/2024.
//

#include <metal_stdlib>
using namespace metal;
#include "../Helpers.h"

[[ stitchable ]] half4 basicShapes(float2 position, half4 color, float2 size) {
    float2 uv = float2(position.x / size.x, position.y / size.x);
    
    float t = polygon(uv, 3, float3(0.5, 1.0, 0.4));
    float c = circle(uv, float2(0.3, 0.9), 0.4);
    float r = rect(uv, float4(0.4, 0.9, 0.4, 0.4));
    
    return half4(c, t, r, 1.0);
}

