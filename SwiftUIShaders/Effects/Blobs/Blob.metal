//
//  Blob.metal
//  SwiftUIShaders
//
//  Created by Maciej Sienkiewicz on 02/03/2024.
//

#include <metal_stdlib>
using namespace metal;
#include "../Helpers.h"

float variation(float2 v1, float2 v2, float strength, float speed, float time) {
    return sin(dot(normalize(v1), normalize(v2)) * strength + time * speed) / 100.0;
}

float paintBlob(float2 uv, float2 center, float radius, float width, float time) {
    float2 diff = center - uv;
    float len = length(diff);

    len += variation(diff, float2(0.0, 1.0), 5.0, 2.0, time);
    len -= variation(diff, float2(1.0, 0.0), 5.0, 2.0, time);
    
    return smoothstep(radius - width, radius, len) - smoothstep(radius, radius + width, len);
}

[[ stitchable ]] half4 neonBlob(float2 position, half4 color, float2 size, float time) {
    float2 uv = float2(position.x / size.x, position.y / size.x);
    uv.y -= 0.5;
    
    half3 col;
    float radius = 0.35;
    float2 center = 0.5;
    
    //paint color circle
    col = paintBlob(uv, center, radius, 0.1, time);
    
    //color with gradient
    float2 v = rotate2D(uv, time);
    col *= half3(v.x, v.y, 0.7 - v.y * v.x);
    
    //paint white circle
    col += paintBlob(uv, center, radius, 0.01, time);
    
    return half4(col, 1.0);
}
