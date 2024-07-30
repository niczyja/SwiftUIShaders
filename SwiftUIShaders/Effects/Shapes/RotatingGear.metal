//
//  RotatingGear.metal
//  SwiftUIShaders
//
//  Created by Maciej Sienkiewicz on 30/07/2024.
//

#include <metal_stdlib>
using namespace metal;
#include "../Helpers.h"

float gear(float2 uv, float theeth = 10, float rotation = 0) {
    float2 pos = float2(uv.x - 0.5, uv.y - 1.0);
    float r = length(pos) * 2;
    float a = atan2(pos.y, pos.x) + rotation;
    return plot(r, smoothstep(-0.5, 1.0, cos(a * theeth)) * 0.2 + 0.5);
}

[[ stitchable ]] half4 rotatingGear(float2 position, half4 color, float2 size, float time) {
    float2 uv = float2(position.x / size.x, position.y / size.x);
    float pct = gear(uv, 12.0, time);
    return half4(pct * uv.x, pct * uv.y, pct * nsin(time), 1.0);
}
