//
//  SizeAwareColor.metal
//  SwiftUIShaders
//
//  Created by Maciej Sienkiewicz on 02/03/2024.
//

#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] half4 sizeAwareColor(float2 position, half4 color, float2 size) {
    float2 uv = position.xy / size.xy;
    return half4(uv.x / uv.y, uv.y / uv.x, color.b, 1.0);
}

