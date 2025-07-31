#version 450 core

#extension GL_GOOGLE_include_directive: enable
#ifndef GL_GOOGLE_include_directive
#extension GL_ARB_separate_shader_objects : enable
#endif

in vec4 position;
in vec2 uv;
out vec2 tc;

#include "window.glsl"
#include "pslib.glsl"
#include "psobj.glsl"
#include "train.glsl"

const float halfdig = 126.0;
const float digbykm = halfdig / 60.0;

void main() {
	vec4 coord = position * scalingObjectv4() + offsetGeometoryv4();
	coord = scaling2dv4(coord, 10.0);
	coord = rotatedv4(coord, int(halfdig - digbykm * abs(speed)));
	gl_Position = coord * scalingWindow();
	tc = uv;
}