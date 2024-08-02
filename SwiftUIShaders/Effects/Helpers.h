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
float2 rotate2D(float2 uv, float angle);

/// Scale
float2 scale2D(float2 uv, float2 scale);

/// Tile with separate rows and cols count
float2 tile(float2 uv, float cols, float rows);

/// Tile with equal number of rows and cols
float2 tile(float2 uv, float zoom);

#endif /* Helpers_h */
