//
//  Helpers.metal
//  SwiftUIShaders
//
//  Created by Maciej Sienkiewicz on 30/07/2024.
//

#include <metal_stdlib>
using namespace metal;
#include "Helpers.h"

//MARK: - Converting

float nsin(float t) {
    return 0.5 * (sin(t) + 1);
}

float ncos(float t) {
    return 0.5 * (cos(t) + 1);
}

//MARK: - Shapes

float circle(float2 uv, float2 center, float radius, float smooth) {
    return smoothstep(radius, radius + smooth, 2 * distance(uv, center));
}

float rect(float2 uv, float4 coords, float smooth) {
    float2 rtl = coords.xy;
    float2 rbr = coords.xy + coords.zw;
    float2 res = coords.zw * smooth;
    float2 tl = smoothstep(rtl - res, rtl + res, uv);
    float2 br = 1 - smoothstep(rbr - res, rbr + res, uv);
    return 1 - tl.x * tl.y * br.x * br.y;
}

float polygon(float2 uv, float edges, float3 coords, float smooth) {
    uv = (2 * uv - 1) - (2 * coords.xy - 1);
    float r = 2 * M_PI_F / edges;
    float a = atan2(uv.x, uv.y);
    return 1 - smoothstep(coords.z, coords.z + smooth, cos(floor(0.5 + a / r) * r - a) * length(uv));
}

float plot(float2 uv, float pct, float smooth) {
    return smoothstep(pct - smooth, pct, uv.y) - smoothstep(pct, pct + smooth, uv.y);
}

float stroke(float2 uv, float weight, float smooth) {
    return 1 - rect(uv, float4(weight, weight, float2(1 - 2 * weight)), smooth);
}

//MARK: - Transform

float2 rotate2D(float2 uv, float angle) {
    uv -= 0.5;
    uv *= float2x2(cos(angle), -sin(angle), sin(angle), cos(angle));
    uv += 0.5;
    return uv;
}

float2 scale2D(float2 uv, float2 scale) {
    uv -= 0.5;
    uv *= float2x2(scale.x, 0.0, 0.0, scale.y);
    uv += 0.5;
    return uv;
}
