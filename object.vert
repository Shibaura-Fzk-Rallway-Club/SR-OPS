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

void main() {
	vec4 coord = position * scalingObjectv4();
    coord += offsetObjectv4();
    gl_Position = coord * scalingWindow();
	tc = uv;
}