//
//  SizeAwareColor.metal
//  SwiftUIShaders
//
//  Created by Maciej Sienkiewicz on 02/03/2024.
//

#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] half4 sizeAwareColor(float2 position, half4 color, float2 size) {
    
    return half4(color.r * position.x / size.x, color.g * position.y / size.y, color.b * position.x / size.y, 1.0 * position.y / size.x);
}

