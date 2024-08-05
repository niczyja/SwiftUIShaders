//
//  View+Mods.swift
//  SwiftUIShaders
//
//  Created by Maciej Sienkiewicz on 02/03/2024.
//

import SwiftUI

extension View {

    func colorEffectShader(_ name: String) -> some View {
        modifier(ColorEffectShader(shaderName: name))
    }
    
    func seededColorEffectShader(_ name: String, _ seed: Double) -> some View {
        modifier(SeededColorEffectShader(shaderName: name, seed: seed))
    }
    
    func animatedColorEffectShader(_ name: String) -> some View {
        modifier(AnimatedColorEffectShader(shaderName: name))
    }
}

//MARK: - Color effects

struct ColorEffectShader: ViewModifier {
    let shaderName: String
    
    func body(content: Content) -> some View {
        content.visualEffect { content, geometryProxy in
            content.colorEffect(ShaderFunction(library: .default, name: shaderName)(
                .float2(geometryProxy.size)
            ))
        }
    }
}

struct SeededColorEffectShader: ViewModifier {
    let shaderName: String
    let seed: Double

    func body(content: Content) -> some View {
        content.visualEffect { content, geometryProxy in
            content.colorEffect(ShaderFunction(library: .default, name: shaderName)(
                .float2(geometryProxy.size),
                .float(seed)
            ))
        }
    }
}

struct AnimatedColorEffectShader: ViewModifier {
    let shaderName: String
    let startDate: Date = .now
    
    func body(content: Content) -> some View {
        TimelineView(.animation) { _ in
            content.visualEffect { content, geometryProxy in
                content.colorEffect(ShaderFunction(library: .default, name: shaderName)(
                    .float2(geometryProxy.size),
                    .float(startDate.timeIntervalSinceNow)
                ))
            }
        }
    }
}
