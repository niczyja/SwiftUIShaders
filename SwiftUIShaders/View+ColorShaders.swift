//
//  View+Mods.swift
//  SwiftUIShaders
//
//  Created by Maciej Sienkiewicz on 02/03/2024.
//

import SwiftUI

//MARK: - Color

extension View {
    func colorShader() -> some View {
        modifier(ColorShader())
    }
}

struct ColorShader: ViewModifier {
    func body(content: Content) -> some View {
        content
            .colorEffect(ShaderLibrary.color())
    }
}

//MARK: - Size aware color

extension View {
    func sizeAwareColorShader() -> some View {
        modifier(SizeAwareColorShader())
    }
}

struct SizeAwareColorShader: ViewModifier {
    func body(content: Content) -> some View {
        content
            .visualEffect { content, geometryProxy in
                content
                    .colorEffect(ShaderLibrary.sizeAwareColor(
                        .float2(geometryProxy.size)
                    ))
            }
    }
}

//MARK: - Time aware color

extension View {
    func timeAwareColorShader() -> some View {
        modifier(TimeAwareColorShader())
    }
}

struct TimeAwareColorShader: ViewModifier {
    private let startDate = Date()
    func body(content: Content) -> some View {
        TimelineView(.animation) { _ in
            content.visualEffect { content, geometryProxy in
                content
                    .colorEffect(ShaderLibrary.timeAwareColor(
                        .float2(geometryProxy.size),
                        .float(startDate.timeIntervalSinceNow)
                    ))
            }
        }
    }
}

//MARK: - Wood grain shader

extension View {
    func woodGrain(seed: Double) -> some View {
        modifier(WoodGrain(seed: seed))
    }
}

struct WoodGrain: ViewModifier {
    let seed: Double
    func body(content: Content) -> some View {
        content
            .visualEffect { content, geometryProxy in
                content
                    .colorEffect(ShaderLibrary.woodGrain(
                        .float2(geometryProxy.size),
                        .float(seed)
                    ))
            }
    }
}

//MARK: - Shapes

extension View {
    func basicShapes() -> some View {
        modifier(BasicShapes())
    }
}

struct BasicShapes: ViewModifier {
    func body(content: Content) -> some View {
        content.visualEffect { content, geometryProxy in
            content.colorEffect(ShaderLibrary.basicShapes(.float2(geometryProxy.size)))
        }
    }
}

extension View {
    func rotatingGear() -> some View {
        modifier(RotatingGear())
    }
}

struct RotatingGear: ViewModifier {
    private let startDate = Date()
    func body(content: Content) -> some View {
        TimelineView(.animation) { _ in
            content.visualEffect { content, geometryProxy in
                content.colorEffect(ShaderLibrary.rotatingGear(
                    .float2(geometryProxy.size),
                    .float(startDate.timeIntervalSinceNow)
                ))
            }
        }
    }
}

extension View {
    func flyingCross() -> some View {
        modifier(FlyingCross())
    }
}

struct FlyingCross: ViewModifier {
    private let startDate = Date()
    func body(content: Content) -> some View {
        TimelineView(.animation) { _ in
            content.visualEffect { content, geometryProxy in
                content.colorEffect(ShaderLibrary.flyingCross(
                    .float2(geometryProxy.size),
                    .float(startDate.timeIntervalSinceNow)
                ))
            }
        }
    }
}

//MARK: - Ripples

extension View {
    func ripples() -> some View {
        modifier(Ripples())
    }
}

struct Ripples: ViewModifier {
    private let startDate = Date()
    func body(content: Content) -> some View {
        TimelineView(.animation) { _ in
            content.visualEffect { content, geometryProxy in
                content
                    .colorEffect(ShaderLibrary.ripples(
                        .float2(geometryProxy.size),
                        .float(startDate.timeIntervalSinceNow)
                    ))
            }
        }
    }
}

//MARK: - Blob

extension View {
    func neonBlob() -> some View {
        modifier(NeonBlob())
    }
}

struct NeonBlob: ViewModifier {
    private let startDate = Date()
    func body(content: Content) -> some View {
        TimelineView(.animation) { _ in
            content.visualEffect { content, geometryProxy in
                content
                    .colorEffect(ShaderLibrary.neonBlob(
                        .float2(geometryProxy.size),
                        .float(startDate.timeIntervalSinceNow)
                    ))
            }
        }
    }
}

extension View {
    func glowingBlobs() -> some View {
        modifier(GlowingBlobs())
    }
}

struct GlowingBlobs: ViewModifier {
    private let startDate = Date()
    func body(content: Content) -> some View {
        TimelineView(.animation) { _ in
            content.visualEffect { content, geometryProxy in
                content.colorEffect(ShaderLibrary.glowingBlobs(
                    .float2(geometryProxy.size),
                    .float(startDate.timeIntervalSinceNow)
                ))
            }
        }
    }
}

//MARK: - Dither

extension View {
    func dither() -> some View {
        modifier(Dither())
    }
}

struct Dither: ViewModifier {
    func body(content: Content) -> some View {
        content
            .colorEffect(ShaderLibrary.dither())
    }
}

//MARK: - Patterns

extension View {
    func basicPatterns() -> some View {
        modifier(BasicPatterns())
    }
}

struct BasicPatterns: ViewModifier {
    private let startDate = Date()
    func body(content: Content) -> some View {
        TimelineView(.animation) { _ in
            content.visualEffect { content, geometryProxy in
                content.colorEffect(ShaderLibrary.basicPatterns(
                    .float2(geometryProxy.size),
                    .float(startDate.timeIntervalSinceNow)
                ))
            }
        }
    }
}

extension View {
    func offsetPattern() -> some View {
        modifier(OffsetPattern())
    }
}

struct OffsetPattern: ViewModifier {
    private let startDate = Date()
    func body(content: Content) -> some View {
        TimelineView(.animation) { _ in
            content.visualEffect { content, geometryProxy in
                content.colorEffect(ShaderLibrary.offsetPattern(
                    .float2(geometryProxy.size),
                    .float(startDate.timeIntervalSinceNow)
                ))
            }
        }
    }
}

extension View {
    func truchetTiles() -> some View {
        modifier(TruchetTiles())
    }
}

struct TruchetTiles: ViewModifier {
    private let startDate = Date()
    func body(content: Content) -> some View {
        TimelineView(.animation) { _ in
            content.visualEffect { content, geometryProxy in
                content.colorEffect(ShaderLibrary.truchetTiles(
                    .float2(geometryProxy.size),
                    .float(startDate.timeIntervalSinceNow)
                ))
            }
        }
    }
}
