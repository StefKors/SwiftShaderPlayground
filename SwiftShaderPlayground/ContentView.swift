//
//  ContentView.swift
//  SwiftShaderPlayground
//
//  Created by Stef Kors on 08/06/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    SineDistortion()
                } label: {
                    Text("Sine Distortion")
                }

                NavigationLink {
                    ReededGlass()
                } label: {
                    Text("Reeded Glass")
                }

                NavigationLink {
                    AngledFill()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .ignoresSafeArea()
                } label: {
                    Text("Angled Fill")
                }

            }
            .listStyle(.plain)
            .navigationTitle("Playgrounds")
        }

    }
}

#Preview {
    ContentView()
}
