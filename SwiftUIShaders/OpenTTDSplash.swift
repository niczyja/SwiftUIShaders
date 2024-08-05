//
//  OpenTTDSplash.swift
//  SwiftUIShaders
//
//  Created by Maciej Sienkiewicz on 30/07/2024.
//

import SwiftUI

struct OpenTTDSplash: View {
    var body: some View {
        ZStack {
            Color(.black)
            ZStack {
                Rectangle()
                    .frame(width: 150, height: 33)
                    .foregroundStyle(.green.gradient)
                Text("Tycoon")
                    .textCase(.uppercase)
                    .font(.system(size: 20, weight: .black, design: .serif))
                    .tracking(2)
            }
            .rotationEffect(.degrees(-45))
            .offset(x: -82, y: -82)
            ZStack {
                Rectangle()
                    .frame(width: 150, height: 33)
                    .foregroundStyle(.green.gradient)
                Text("Board")
                    .textCase(.uppercase)
                    .font(.system(size: 20, weight: .black, design: .serif))
                    .tracking(2)
            }
            .rotationEffect(.degrees(45))
            .offset(x: 82, y: -82)
            ZStack {
                Text("⛴️")
                    .font(.system(size: 100))
                    .offset(x: -70, y: 110)
                Text("🚛")
                    .font(.system(size: 100))
                    .offset(x: -60, y: 110)
                    .scaleEffect(CGSize(width: -1.0, height: 1.0))
                Rectangle()
                    .frame(width: 200, height: 200)
                    .foregroundStyle(.shadow(.drop(radius: 5)))
                    .foregroundStyle(.orange.gradient)
                    .rotationEffect(.degrees(-45))
                Rectangle()
                    .stroke()
                    .frame(width: 200, height: 200)
                    .rotationEffect(.degrees(-45))
                Text("$")
                    .font(.system(size: 200, weight: .bold, design: .monospaced))
                    .foregroundStyle(.shadow(.drop(color: .black, radius: 1)))
                    .foregroundStyle(.white.shadow(.inner(radius: 1)))
                Text("🚊")
                    .font(.system(size: 110))
                    .offset(x: 2, y: 110)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OpenTTDSplash()
}
