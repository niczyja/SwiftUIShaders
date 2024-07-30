//
//  Model.swift
//  SwiftUIShaders
//
//  Created by Maciej Sienkiewicz on 30/07/2024.
//

import Foundation
import SwiftUI

struct ShaderGroup: Identifiable, Hashable {
    let id: UUID = UUID()
    let name: String
    let shaders: [ShowcaseShader]
}

struct ShowcaseShader: Identifiable, Hashable {
    let id: UUID = UUID()
    let name: String
    let modifier: any ViewModifier
    
    static func == (lhs: ShowcaseShader, rhs: ShowcaseShader) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
    }
}

//MARK: -

let showcasedShaders: [ShaderGroup] = [
    ShaderGroup(name: "Colors", shaders: [
        ShowcaseShader(name: "Simple color", modifier: ColorShader()),
        ShowcaseShader(name: "Size aware color", modifier: SizeAwareColorShader()),
        ShowcaseShader(name: "Time aware color", modifier: TimeAwareColorShader())
    ]),
    ShaderGroup(name: "Shapes", shaders: [
        ShowcaseShader(name: "Basic shapes", modifier: BasicShapes()),
        ShowcaseShader(name: "Rotating gear", modifier: RotatingGear()),
        ShowcaseShader(name: "Flying cross", modifier: FlyingCross()),
    ]),
    ShaderGroup(name: "Ripples and Blobs", shaders: [
        ShowcaseShader(name: "Ripples", modifier: Ripples()),
        ShowcaseShader(name: "Glowing blobs", modifier: GlowingBlobs()),
        ShowcaseShader(name: "Neon blob", modifier: NeonBlob())
    ]),
    ShaderGroup(name: "Wood", shaders: [
        ShowcaseShader(name: "Exotic grain", modifier: WoodGrain(seed: Double.random(in: 0...1)))
    ]),
    ShaderGroup(name: "Dither", shaders: [
        ShowcaseShader(name: "Ordered dithering (on view)", modifier: Dither()),
        ShowcaseShader(name: "Ordered dithering (on image)", modifier: Dither())
    ])
]
