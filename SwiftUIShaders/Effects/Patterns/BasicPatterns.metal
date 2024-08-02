//
//  BasicPatterns.metal
//  SwiftUIShaders
//
//  Created by Maciej Sienkiewicz on 02/08/2024.
//

#include <metal_stdlib>
#include <metal_math>
using namespace metal;
#include "../Helpers.h"

float2 tile(float2 uv, float cols, float rows) {
    uv.x *= cols;
    uv.y *= rows;
    return fract(uv);
}

float2 tile(float2 uv, float zoom) {
    return tile(uv, zoom, zoom);
}

[[ stitchable ]] half4 basicPatterns(float2 position, half4 color, float2 size, float time) {
    float2 uv = float2(position.x / size.x, position.y / size.x);
    float zoom = 10.0;
    float cidx = floor(uv.x * zoom);
    float ridx = floor(uv.y * zoom);

    uv = tile(uv, zoom);
    half3 col = half3(uv.x, uv.y, 0.0);
    
    float icf, irf = 0.0;
    float modc = modf(cidx / 2, icf);
    float modr = modf(ridx / 2, irf);
    
    time *= 1.5;
    float tmod1 = nsin(time + icf);
    float tmod2 = nsin(time + irf);
    float tmod3 = ncos(time - icf - irf);
    
    if ((modc && modr) || (!modc && !modr)) {
        uv = scale2D(uv, tmod1 / 2 + 0.75);
        col = circle(uv, 0.5, 0.6);
    } else {
        uv = rotate2D(uv, tmod2);
        col = rect(uv, float4(0.2, 0.2, 0.6, 0.6));
    }
    
    col = 1.0 - col;
    return half4((tmod1 + 0.5) * col.x, (tmod2 + 0.5) * col.y, (tmod3 + 0.5) * col.z, 1.0);
}
