//
//  GlowingBlobs.metal
//  SwiftUIShaders
//
//  Created by Maciej Sienkiewicz on 30/07/2024.
//

// Blobs by @paulofalcao
// https://www.shadertoy.com/view/lsfGzr

#include <metal_stdlib>
using namespace metal;

float glowingBlobPoint(float x, float y, float fx, float fy, float sx, float sy, float t) {
   float xx = x + sin(t * fx) * sx;
   float yy = y + cos(t * fy) * sy;
   return 1.0 / sqrt(xx * xx + yy * yy);
}

[[ stitchable ]] half4 glowingBlobs(float2 position, half4 color, float2 size, float time) {
    
    float2 p = (position.xy / size.x) * 2.0 - float2(1.0, size.y / size.x);
    
    p = p * 2.0;
    
    float x = p.x;
    float y = p.y;
    
    float a = glowingBlobPoint(x, y, 3.3, 2.9, 0.3, 0.3, time);
    a = a + glowingBlobPoint(x, y, 1.9, 2.0, 0.4, 0.4, time);
    a = a + glowingBlobPoint(x, y, 0.8, 0.7, 0.4, 0.5, time);
    a = a + glowingBlobPoint(x, y, 2.3, 0.1, 0.6, 0.3, time);
    a = a + glowingBlobPoint(x, y, 0.8, 1.7, 0.5, 0.4, time);
    a = a + glowingBlobPoint(x, y, 0.3, 1.0, 0.4, 0.4, time);
    a = a + glowingBlobPoint(x, y, 1.4, 1.7, 0.4, 0.5, time);
    a = a + glowingBlobPoint(x, y, 1.3, 2.1, 0.6, 0.3, time);
    a = a + glowingBlobPoint(x, y, 1.8, 1.7, 0.5, 0.4, time);

    float b = glowingBlobPoint(x, y, 1.2, 1.9, 0.3, 0.3, time);
    b = b + glowingBlobPoint(x, y, 0.7, 2.7, 0.4, 0.4, time);
    b = b + glowingBlobPoint(x, y, 1.4, 0.6, 0.4, 0.5, time);
    b = b + glowingBlobPoint(x, y, 2.6, 0.4, 0.6, 0.3, time);
    b = b + glowingBlobPoint(x, y, 0.7, 1.4, 0.5, 0.4, time);
    b = b + glowingBlobPoint(x, y, 0.7, 1.7, 0.4, 0.4, time);
    b = b + glowingBlobPoint(x, y, 0.8, 0.5, 0.4, 0.5, time);
    b = b + glowingBlobPoint(x, y, 1.4, 0.9, 0.6, 0.3, time);
    b = b + glowingBlobPoint(x, y, 0.7, 1.3, 0.5, 0.4, time);

    float c = glowingBlobPoint(x, y, 3.7, 0.3, 0.3, 0.3, time);
    c = c + glowingBlobPoint(x, y, 1.9, 1.3, 0.4, 0.4, time);
    c = c + glowingBlobPoint(x, y, 0.8, 0.9, 0.4, 0.5, time);
    c = c + glowingBlobPoint(x, y, 1.2, 1.7, 0.6, 0.3, time);
    c = c + glowingBlobPoint(x, y, 0.3, 0.6, 0.5, 0.4, time);
    c = c + glowingBlobPoint(x, y, 0.3, 0.3, 0.4, 0.4, time);
    c = c + glowingBlobPoint(x, y, 1.4, 0.8, 0.4, 0.5, time);
    c = c + glowingBlobPoint(x, y, 0.2, 0.6, 0.6, 0.3, time);
    c = c + glowingBlobPoint(x, y, 1.3, 0.5, 0.5, 0.4, time);

    float3 d = float3(a, b, c) / 32.0;
    
    return half4(d.x, d.y, d.z, (d.x + d.y + d.z) * 8.0);
}
