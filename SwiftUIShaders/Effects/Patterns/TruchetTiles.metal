//
//  TruchetTiles.metal
//  SwiftUIShaders
//
//  Created by Maciej Sienkiewicz on 03/08/2024.
//

#include <metal_stdlib>
using namespace metal;
#include "../Helpers.h"

float2 squareTile(float2 uv, float div) {
    uv *= div;
    
    float index = 0.0;
    index += step(1.0, fmod(uv.x, 2.0));
    index += step(1.0, fmod(uv.y, 2.0)) * div;
    
    uv = fract(uv);
    
    if (index == 1) {
        uv = rotate2D(uv, M_PI_F * -0.5);
    } else if (index == 2) {
        uv = rotate2D(uv, M_PI_F * 0.5);
    } else if (index == 3) {
        uv = rotate2D(uv, M_PI_F);
    }
    
    return uv;
}

[[ stitchable ]] half4 truchetTiles(float2 position, half4 color, float2 size, float time) {
    float2 uv = float2(position.x / size.x, position.y / size.x);

    uv = tile(uv, 6.0);
    uv = squareTile(uv, 2.0);
    uv = rotate2D(uv, M_PI_F * time * 0.1);
    
    half3 col = half3(step(uv.x, uv.y), smoothstep(0.0, 1.0, uv.x), smoothstep(0.0, 1.0, uv.y));
//    half3 col = half3(circle(uv, 0.0, 1.0), circle(uv, 1.0, 1.0), circle(uv, 0.5, 1.0));
    
    return half4(col, 1.0);
}
