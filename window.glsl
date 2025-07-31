#ifndef WINDOW_GLSL_
#define WINDOW_GLSL_
#include "def.glsl"

UNIFORM_LOC(UNIFORM_WINDOW_SIZE) uniform vec2 windowSize;
UNIFORM_LOC(UNIFORM_WINDOW_SCALE) uniform float windowScale;

vec4 scalingWindow() {
    return vec4(windowScale / windowSize, 1.0, 1.0);
}
#endif // WINDOW_GLSL_