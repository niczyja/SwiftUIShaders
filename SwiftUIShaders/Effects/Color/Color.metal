//
//  Color.metal
//  SwiftUIShaders
//
//  Created by Maciej Sienkiewicz on 02/03/2024.
//

#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] half4 color(float2 position, half4 color) {
    
    return half4(color.r * position.x / 255.0, color.g * position.y / 255.0, color.b, 0.75);
}
