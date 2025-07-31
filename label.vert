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
#include "pslabel.glsl"
#include "train.glsl"

void main() {
	float buf = float(brakeNotch);
	int rem = getNumofDigits(int(buf));
	vec2 bc = div1dv2(uv, float(labelDigitsCount));
	tc = bc + vec2(pixelSize * float(rem), 0.0);
	vec4 coord  = offsetLabelPostion(position, ObjectScale);
	gl_Position = (coord + offsetPositionv4()) * scalingWindow();
}