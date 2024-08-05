//
//  Model.swift
//  SwiftUIShaders
//
//  Created by Maciej Sienkiewicz on 30/07/2024.
//

import Foundation
import SwiftUI

struct ShowcaseShader: Identifiable, Hashable {
    
    enum Kind {
        case color, animatedColor, seededColor
    }
    
    let id: UUID = UUID()
    let name: String
    let kind: Kind
    let functionName: String
}

struct ShaderGroup: Identifiable, Hashable {
    let id: UUID = UUID()
    let name: String
    let shaders: [ShowcaseShader]
}

//MARK: - Store

@Observable class ShowcaseShaderStore {
    
    var groups: [ShaderGroup] = [
        ShaderGroup(name: "Colors", shaders: [
            ShowcaseShader(name: "Basic color", kind: .color, functionName: "basicColor"),
            ShowcaseShader(name: "Size aware color", kind: .color, functionName: "sizeAwareColor"),
            ShowcaseShader(name: "Time aware color", kind: .animatedColor, functionName: "timeAwareColor"),
        ]),
        ShaderGroup(name: "Shapes", shaders: [
            ShowcaseShader(name: "Basic shapes", kind: .color, functionName: "basicShapes"),
            ShowcaseShader(name: "Rotating gear", kind: .animatedColor, functionName: "rotatingGear"),
            ShowcaseShader(name: "Flying cross", kind: .animatedColor, functionName: "flyingCross"),
        ]),
        ShaderGroup(name: "Ripples and Blobs", shaders: [
            ShowcaseShader(name: "Ripples", kind: .animatedColor, functionName: "ripples"),
            ShowcaseShader(name: "Glowing blobs", kind: .animatedColor, functionName: "glowingBlobs"),
            ShowcaseShader(name: "Neon blob", kind: .animatedColor, functionName: "neonBlob"),
        ]),
        ShaderGroup(name: "Wood", shaders: [
            ShowcaseShader(name: "Exotic grain", kind: .seededColor, functionName: "woodGrain"),
        ]),
        ShaderGroup(name: "Dither", shaders: [
            ShowcaseShader(name: "Ordered dithering (on view)", kind: .color, functionName: "dither"),
            ShowcaseShader(name: "Ordered dithering (on image)", kind: .color, functionName: "dither"),
        ]),
        ShaderGroup(name: "Patterns", shaders: [
            ShowcaseShader(name: "Basic patterns", kind: .animatedColor, functionName: "basicPatterns"),
            ShowcaseShader(name: "Offset pattern", kind: .animatedColor, functionName: "offsetPattern"),
            ShowcaseShader(name: "Truchet tiles", kind: .animatedColor, functionName: "truchetTiles"),
        ]),
    ]
}
