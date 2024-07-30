//
//  Dither.metal
//  SwiftUIShaders
//
//  Created by Maciej Sienkiewicz on 21/06/2024.
//

#include <metal_stdlib>
using namespace metal;

/// http://alex-charlton.com/posts/Dithering_on_the_GPU/

//extern constant half indices[] = {
//    0,  8,  2,  10,
//    12, 4,  14, 6,
//    3,  11, 1,  9,
//    15, 7,  13, 5
//};

extern constant half indices[] = {
    0,  32, 8,  40, 2,  34, 10, 42,
    48, 16, 56, 24, 50, 18, 58, 26,
    12, 44, 4,  36, 14, 46, 6,  38,
    60, 28, 52, 20, 62, 30, 54, 22,
    3,  35, 11, 43, 1,  33, 9,  41,
    51, 19, 59, 27, 49, 17, 57, 25,
    15, 47, 7,  39, 13, 45, 5,  37,
    63, 31, 55, 23, 61, 29, 53, 21
};

half indexValue(float2 position) {
    int ix = int(position.x) % 8;
    int iy = int(position.y) % 8;
    return indices[(ix + iy * 8)] / 64.0;
}

half dither(half colorComp, float2 position) {
    half closest = (colorComp < 0.9);
    half secondClosest = 1 - closest;
    half distance = abs(closest - colorComp);
    return (distance < indexValue(position)) ? closest : secondClosest;
}

[[ stitchable ]] half4 dither(float2 position, half4 color) {
    return half4(dither(color[0], position),
                 dither(color[1], position),
                 dither(color[2], position),
                 dither(color[3], position));
}
