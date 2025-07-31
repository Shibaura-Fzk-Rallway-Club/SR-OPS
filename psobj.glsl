#ifndef PSOBJ_GLSL_
#define PSOBJ_GLSL_
#include "def.glsl"

UNIFORM_LOC(UNIFORM_OBJECT_SCALE) uniform vec2 ObjectScale;
UNIFORM_LOC(UNIFORM_OBJECT_GEOMETRY) uniform vec2 ObjectGeometory;
UNIFORM_LOC(UNIFORM_OBJECT_POSITION) uniform vec2 ObjectPosition;

vec4 scalingObjectv4() {
    return vec4(ObjectScale, 1.0, 1.0);
}

vec4 offsetObjectv4() {
    return vec4(ObjectPosition - ObjectGeometory, 0.0, 0.0);
}

vec4 offsetGeometoryv4() {
    return vec4(-ObjectGeometory, 0.0, 0.0);
}

vec4 offsetPositionv4() {
    return vec4(ObjectPosition, 0.0, 0.0);
}
#endif // PSOBJ_GLSL_