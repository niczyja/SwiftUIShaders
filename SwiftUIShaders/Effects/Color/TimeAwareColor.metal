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

    return half4(nsin(time + 1.9 * M_PI_2_F * color.r * position.x / size.y),
                 nsin(time + 2.7 * M_PI_4_F * color.g * position.y / size.x),
                 nsin(time + 3.5 * M_PI_2_F * color.b * position.x / size.x),
                 nsin(time / 4.1 * M_PI_4_F * position.y / size.y) + 0.5);
}

