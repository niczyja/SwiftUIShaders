//
//  Ripples.metal
//  SwiftUIShaders
//
//  Created by Maciej Sienkiewicz on 02/03/2024.
//

#include <metal_stdlib>
using namespace metal;
#include "../Helpers.h"

extern constant float2 center = float2(0.5);
extern constant float speed = 0.05;

[[ stitchable ]] half4 ripples(float2 position, half4 color, float2 size, float time)
{
    float invr = size.y / size.x;
    float2 uv = position.xy / size.xy;
    
    float x = center.x - uv.x;
    float y = (center.y - uv.y) * invr;
    float r = -(x*x + y*y);
    float z = 1.0 + nsin((-r + time * speed) * 64);
    
    float3 vec = float3(uv, nsin(time)) * z;
    
    return half4(half3(vec), 1.0);
}
