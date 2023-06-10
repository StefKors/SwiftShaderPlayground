//
//  DragAndDropSineDistortion.swift
//  SwiftShaderPlayground
//
//  Created by Stef Kors on 08/06/2023.
//

import SwiftUI
import ViewToAppIconSet

struct AppIconView: View {
    @IconRelativeMetric var padding = 10

    var body: some View {
        Image(systemName: "circle.hexagongrid.fill")
            .resizable()
            .scaledToFit()
            .padding(padding)
            .foregroundColor(.white)
            .background(Color.indigo)
    }
}

struct DragAndDropSineDistortion: View {
    @State private var spread: CGFloat = 22.0
    @State private var amplitudeX: CGFloat = 0.0
    @State private var amplitudeY: CGFloat = 0.0

    @State private var location: CGPoint = CGPoint(x: 150, y: 150)
    @GestureState private var startLocation: CGPoint? = nil // 1

    var simpleDrag: some Gesture {
        DragGesture()
            .onChanged { value in
                var newLocation = startLocation ?? location // 3
                newLocation.x += value.translation.width
                newLocation.y += value.translation.height

                let ampliY = (abs(value.predictedEndTranslation.width) - abs(value.translation.width))/10
                self.amplitudeY = min(ampliY + 4, 25)

                let ampliX = (abs(value.predictedEndTranslation.height) - abs(value.translation.height))/10
                self.amplitudeX = min(ampliX + 4, 25)

                self.location = newLocation
            }.updating($startLocation) { (value, startLocation, transaction) in
                startLocation = startLocation ?? location // 2
            }
            .onEnded { value in
                    self.amplitudeX = 0
                self.amplitudeY = 0
            }
    }

    var body: some View {
        VStack {

            ZStack {
                AppIconView()
                    .iconStyle(.macOS)
                    .frame(width: 200, height: 200, alignment: .center)
                    .padding(100)
                    .distortionEffect(
                        dragAndDropSineDistortionShader,
                        maxSampleOffset: CGSize(width: 5, height: 5)
                    )
                    // .animation(.interpolatingSpring(), value: spread)
                    .animation(.interpolatingSpring(stiffness: 170, damping: 12), value: amplitudeX)
                    .animation(.interpolatingSpring(stiffness: 170, damping: 12), value: amplitudeY)
                    .position(location)
                    .gesture(
                        simpleDrag
                    )
            }




            Spacer()

            // ControlForm(value1: $spread, value2: $amplitude)
            //     .frame(maxHeight: 150)
        }
    }

    var dragAndDropSineDistortionShader: Shader {
        ShaderLibrary.dragAndDropSineDistortion(
            .float(spread),
            .float(amplitudeX),
            .float(amplitudeY)
        )
    }
}


fileprivate struct ControlForm: View {
    @Binding var value1: CGFloat
    @Binding var value2: CGFloat

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
        let range: ClosedRange<CGFloat> = 1...40
        Section {
            Slider(value: $value1, in: range) {
                Label(value1.formatted().description, systemImage: "water.waves.and.arrow.up")
            } minimumValueLabel: {
                Label(range.lowerBound.formatted().description, systemImage: "water.waves.and.arrow.up")
            } maximumValueLabel: {
                Label(range.upperBound.formatted().description, systemImage: "water.waves.and.arrow.down")
            }
        } header: {
            Label(value1.formatted().description, systemImage: "water.waves.and.arrow.up")
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
    DragAndDropSineDistortion()
}
