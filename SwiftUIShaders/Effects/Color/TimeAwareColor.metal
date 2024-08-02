//
//  TimeAwareColor.metal
//  SwiftUIShaders
//
//  Created by Maciej Sienkiewicz on 02/03/2024.
//

#include <metal_stdlib>
using namespace metal;
#include "../Helpers.h"

[[ stitchable ]] half4 timeAwareColor(float2 position, half4 color, float2 size, float time) {
    float2 uv = position.xy / size.xy;
    float t = nsin(time);
    return half4(uv.x / uv.y - t, uv.y / uv.x - t, color.b, 1.0);
}

