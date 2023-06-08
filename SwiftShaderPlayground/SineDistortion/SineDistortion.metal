#include <metal_stdlib>
using namespace metal;

// [[ stitchable ]] half4
// colorShift(float2 position, half4 color, half4 secondColor)
// {
//     // Equal spaced Horizontal gradient lines
//     float width = 10.0;
//     float pMagnitude = position.y;
//     float pAngle = (position.x == 0.0f ? (M_PI_F / 2.0f) : atan(position.y / position.x));
//     return (color + color * fmod(abs(pMagnitude + pMagnitude), 50) / width) / 2;
// }


// No distortion
// [[ stitchable ]] float2
// colorShift(float2 position, half4 color)
// {
//     float x = position.x;
//     float y = position.y;
//     return float2(x, y);
// }

[[ stitchable ]] float2
sineDistortion(float2 position, half4 color, float spread, float amplitude)
{
    float offset = (position.y / spread);
    float shift = sin(offset);
    float x = position.x + (shift * amplitude);
    float y = position.y;
    return float2(x, y);
}
