//
//  ContentView.swift
//  SwiftUIShaders
//
//  Created by Maciej Sienkiewicz on 02/03/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: ShowcaseShader?
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selection) {
                ForEach(showcasedShaders) { group in
                    Section(group.name) {
                        ForEach(group.shaders) { shader in
                            NavigationLink(shader.name, value: shader)
                        }
                    }
                }
            }
            .navigationTitle("Shaders")
        } detail: {
            ZStack {
                switch selection {
                case .some(let s) where s.modifier is ColorShader:
                    Color.pink.colorShader()
                case .some(let s) where s.modifier is SizeAwareColorShader:
                    Color.pink.sizeAwareColorShader()
                case .some(let s) where s.modifier is TimeAwareColorShader:
                    Color.pink.timeAwareColorShader()
                case .some(let s) where s.modifier is BasicShapes:
                    Color.black.basicShapes()
                case .some(let s) where s.modifier is RotatingGear:
                    Color.pink.rotatingGear()
                case .some(let s) where s.modifier is FlyingCross:
                    Color.pink.flyingCross()
                case .some(let s) where s.modifier is Ripples:
                    Color.pink.ripples()
                case .some(let s) where s.modifier is GlowingBlobs:
                    Color.black.glowingBlobs()
                case .some(let s) where s.modifier is NeonBlob:
                    Color.pink.neonBlob()
                case .some(let s) where s.modifier is WoodGrain:
                    Color.black.woodGrain(seed: Double.random(in: 0...1))
                case .some(let s) where s.modifier is Dither && s.name.contains("view"):
                    PanelPrezesa().dither()
                case .some(let s) where s.modifier is Dither && s.name.contains("image"):
                    Image("soniczka").resizable().aspectRatio(contentMode: .fit).dither()
                default:
                    Text("Unknown shader")
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
