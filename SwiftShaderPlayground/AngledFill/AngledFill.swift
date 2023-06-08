//
//  AngledFill.swift
//  SwiftShaderPlayground
//
//  Created by Stef Kors on 08/06/2023.
//

import SwiftUI

struct AngledFill: View {
    @State private var stripeSpacing: Float = 10.0
    @State private var stripeAngle: Float = 0.0

    let content = """
Rippled glass refers to textured glass with marked surface waves.[1] Louis Comfort Tiffany made use of such textured glass to represent, for example, water or leaf veins.

The texture is created during the glass sheet-forming process. A sheet is formed from molten glass with a roller that spins on itself, while travelling forward. Normally the roller spins at the same speed as its own forward motion, and the resulting sheet has a smooth surface. In the manufacture of rippled glass, the roller spins faster than its own forward motion. The rippled effect is retained as the glass cools.

In order to cut rippled glass, the sheet may be scored on the smoother side with a carbide glass cutter, and broken at the score line with breaker-grozier pliers.

Breaker-grozier pliers, or groziers, are pliers used by glaziers to break and finish glass in a controlled manner, a technique known as grozing. They are dual purpose pliers, with a flat jaw that is used for breaking out scores and a curved jaw that is used for grozing flares from the edge of broken glass. Both jaws are serrated for removing flares and tiny points of glass.[1]
Use

To break out a score, the glass to be removed is held firmly in the pliers, with the flat jaw on top of the glass near the score line. A sharp bend downward breaks the glass at the score.

To remove unwanted glass flares and unwanted points, the glass piece is held with one hand with the pliers curved side up. A gentle upward rolling scrapes the glass edge against the serrated teeth and removes unwanted glass flares. This removal process is known as grozing.

The tips of these pliers can also be used in a chewing motion to remove small sections of glass or nibble out deep inside curves.
Other tools

Glaziers also use single-purpose pliers such as breaking pliers, with two flat jaws, and running pliers, which apply even pressure on both sides of a score to make a controlled gentle break on the glass.
"""

    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                Text(content)
                    .font(.system(size: 24, weight: .heavy, design: .rounded).width(.condensed))
                    .padding(.horizontal)
            }

            Rectangle()
                .fill(angledFillShader)
                .frame(height: 100)
                .ignoresSafeArea()
                .opacity(0.8)

        }

    }

    var angledFillShader: Shader {
        ShaderLibrary.angledFill(
            .float(stripeSpacing),
            .float(stripeAngle),
            .color(.blue)
        )
    }
}

#Preview {
    AngledFill()
}
