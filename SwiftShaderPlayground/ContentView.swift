//
//  ContentView.swift
//  SwiftShaderPlayground
//
//  Created by Stef Kors on 08/06/2023.
//

import SwiftUI

struct ContentList: View {
    var body: some View {
        List {
            NavigationLink {
                SineDistortion()
                    .navigationTitle("Sine Distortion")
            } label: {
                Text("Sine Distortion")
            }

            NavigationLink {
                DragAndDropSineDistortion()
                    .frame(maxWidth: .infinity)
                    .navigationTitle("Drag and Drop Sine Distortion")
            } label: {
                Text("Drag and Drop Sine Distortion")
            }



            NavigationLink {
                ReededGlass()
                    .navigationTitle("Reeded Glass")
            } label: {
                Text("Reeded Glass")
            }

            NavigationLink {
                AngledFill()
                    .navigationTitle("Angled Fill")
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

struct ContentView: View {
    var body: some View {
#if os(macOS)
        NavigationSplitView {
            ContentList()
        } detail: {
            Text("detail")
        }
#else
        NavigationStack {
            ContentList()
        }
#endif
    }
}

#Preview {
    ContentView()
}
