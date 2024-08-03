//
//  OffsetPattern.metal
//  SwiftUIShaders
//
//  Created by Maciej Sienkiewicz on 02/08/2024.
//

#include <metal_stdlib>
#include <metal_math>
using namespace metal;
#include "../Helpers.h"

[[ stitchable ]] half4 offsetPattern(float2 position, half4 color, float2 size, float time) {
    float2 uv = float2(position.x / size.x, position.y / size.x);

    // colors
    half3 out = half3(1.0);
    half3 bgc = half3(0.06, 0.11, 0.34);
    half3 syc = half3(0.96, 0.86, 0.67);
    half3 bcb = half3(0.73, 0.28, 0.13);

    // small circles
    float2 suv = uv;
    suv *= 9.0;
    suv.y += fmod(suv.x, 2.0) < 1.0 ? -nsin(time) : nsin(time) + 0.5;
    suv = fract(suv);

    out = mix(bgc, syc, half3(1.0 - circle(suv, 0.5, 0.5)));
    out = mix(out, bgc, half3(1.0 - circle(suv, 0.5, 0.1)));
    
    // big circles
    float2 buv = uv;
    buv *= 3.0;
    buv.x += step(1.0, fmod(buv.y, 2.0)) * 0.5;
    buv = fract(buv);

    out = mix(out, bcb, half3(1.0 - circle(buv, 0.5, 0.6)));
    out = mix(out, half3(0.0), half3(1.0 - circle(buv, 0.5, 0.3)));
    
    return half4(out.r, out.g, out.b, 1.0);
}
