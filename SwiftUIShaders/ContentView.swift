//
//  ContentView.swift
//  SwiftUIShaders
//
//  Created by Maciej Sienkiewicz on 02/03/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var shaderStore = ShowcaseShaderStore()
    @State private var selection: ShowcaseShader?
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selection) {
                ForEach(shaderStore.groups) { group in
                    ShaderSection(group: group)
                }
            }
            .navigationTitle("Shaders")
        } detail: {
            ShaderDetail(shader: selection)
                .ignoresSafeArea()
        }
    }
    
    struct ShaderSection: View {
        let group: ShaderGroup
        @SceneStorage private var isExpanded: Bool
        
        init(group: ShaderGroup) {
            self.group = group
            self._isExpanded = SceneStorage(wrappedValue: true, "expanded-\(group.id.uuidString)")
        }
        
        var body: some View {
            Section(group.name, isExpanded: $isExpanded) {
                ForEach(group.shaders) { shader in
                    NavigationLink(shader.name, value: shader)
                }
            }
        }
    }
    
    struct ShaderDetail: View {
        let shader: ShowcaseShader?
        
        var body: some View {
            ZStack {
                switch shader?.kind {
                case .color where shader!.name.contains("on view"):
                    OpenTTDSplash()
                        .colorEffectShader(shader!.functionName)
                case .color where shader!.name.contains("on image"):
                    Image("soniczka")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .colorEffectShader(shader!.functionName)
                case .color:
                    Color.blue
                        .colorEffectShader(shader!.functionName)
                case .animatedColor:
                    Color.blue
                        .animatedColorEffectShader(shader!.functionName)
                case .seededColor:
                    Color.blue
                        .seededColorEffectShader(shader!.functionName, Double.random(in: 0...1))
                case nil:
                    Text("Unknown shader")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
