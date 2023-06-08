//
//  SineDistortion.swift
//  SwiftShaderPlayground
//
//  Created by Stef Kors on 08/06/2023.
//

import SwiftUI

struct SineDistortion: View {
    @State private var spread: Float = 10.0
    @State private var amplitude: Float = 10.0

    var body: some View {
        VStack {
            VStack(spacing: 10) {
                GroupBox("Plain") {
                    Image(systemName: "checkerboard.rectangle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100, alignment: .center)
                }

                GroupBox("Distorted") {
                    Image(systemName: "checkerboard.rectangle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100, alignment: .center)
                        .distortionEffect(SineDistortionShader, maxSampleOffset: CGSize(width: 100, height: 100))
                }
                Spacer()
            }
            .padding(.horizontal)

            ControlForm(value1: $spread, value2: $amplitude)
        }

    }

    var SineDistortionShader: Shader {
        ShaderLibrary.sineDistortion(
            .color(.blue),
            .float(spread),
            .float(amplitude)
        )
    }
}


fileprivate struct ControlForm: View {
    @Binding var value1: Float
    @Binding var value2: Float

    var body: some View {
        Form {
            slider1
            slider2
        }
        .formStyle(.grouped)
        .labelStyle(.titleAndIcon)
    }

    @ViewBuilder
    var slider1: some View {
        Slider(
            value: $value1, in: 1...20) {
                Label("Spacing", systemImage: "water.waves")
            } minimumValueLabel: {
                Image(
                    systemName:
                        "water.waves.and.arrow.up")
            } maximumValueLabel: {
                Image(
                    systemName:
                        "water.waves.and.arrow.down")
            }
    }

    @ViewBuilder
    var slider2: some View {
        Slider(
            value: $value2, in: -100...100) {
                Text("Angle")
            } minimumValueLabel: {
                Image(
                    systemName: "arrow.clockwise")
            } maximumValueLabel: {
                Image(
                    systemName: "arrow.counterclockwise")
            }
    }
}


#Preview {
    SineDistortion()
}
