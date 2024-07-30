//
//  Helpers.h
//  SwiftUIShaders
//
//  Created by Maciej Sienkiewicz on 30/07/2024.
//

#ifndef Helpers_h
#define Helpers_h

/// Normal value using sin
float nsin(float t);

/// Normal value using cos
float ncos(float t);

/// Draw circle
float circle(float2 uv, float2 center, float radius, float smooth = 0.01);

/// Draw rect
float rect(float2 uv, float4 coords, float smooth = 0.01);

/// Draw polygon
float polygon(float2 uv, float edges, float3 coords, float smooth = 0.01);

/// Plot
float plot(float2 uv, float pct, float smooth = 0.01);

/// Stroke
float stroke(float2 uv, float weight, float smooth = 0.01);

/// Rotate
float2x2 rotate2d(float angle);

/// Scale
float2x2 scale2d(float2 scale);

#endif /* Helpers_h */