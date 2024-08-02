//
//  FlyingCross.metal
//  SwiftUIShaders
//
//  Created by Maciej Sienkiewicz on 30/07/2024.
//

#include <metal_stdlib>
using namespace metal;
#include "../Helpers.h"

float cross(float2 uv, float2 center, float2 size) {
    return rect(uv, float4(center.x - size.x / 2, center.y - size.y / 2, size.x, size.y)) *
           rect(uv, float4(center.x - size.y / 2, center.y - size.x / 2, size.y, size.x));
}

[[ stitchable ]] half4 flyingCross(float2 position, half4 color, float2 size, float time) {
    float2 uv = position.xy / size.xy;

    uv = rotate2D(uv, sin(time));
    uv = scale2D(uv, cos(time));
    
    float2 center = 0.1 * float2(sin(time), cos(time)) + 0.5;
    float pct = cross(uv, center, float2(0.2, 0.05));
    
    return half4(pct * uv.x, pct * uv.y, pct * nsin(time), 1.0);
}
