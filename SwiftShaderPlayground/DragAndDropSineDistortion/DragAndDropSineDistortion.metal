//
//  DragAndDropSineDistortion.metal
//  SwiftShaderPlayground
//
//  Created by Stef Kors on 08/06/2023.
//

#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] float2
dragAndDropSineDistortion(float2 position, float spread, float amplitudeX, float amplitudeY)
{
    float offsetY = (position.y / spread);
    float shiftY = sin(offsetY);
    float y = position.y + (shiftY * amplitudeX);

    float offsetX = (position.x / spread);
    float shiftX = sin(offsetX);
    float x = position.x + (shiftX * amplitudeY);
    // float y = position.y;
    return float2(x, y);
}
