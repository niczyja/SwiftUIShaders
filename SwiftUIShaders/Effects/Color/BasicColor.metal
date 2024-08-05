//
//  BasicColor.metal
//  SwiftUIShaders
//
//  Created by Maciej Sienkiewicz on 02/03/2024.
//

#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] half4 basicColor(float2 position, half4 color, float2 size) {
    return half4(position.x / position.y, position.y / position.x, color.b, 1.0);
}
