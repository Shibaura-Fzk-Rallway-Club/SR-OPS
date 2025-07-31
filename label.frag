#version 450 core
#extension GL_GOOGLE_include_directive: enable
#ifndef GL_GOOGLE_include_directive
#extension GL_ARB_separate_shader_objects : enable
#endif

out vec4 fragment;
in vec2 tc;

#include "pslib.glsl"

void main() {
	fragment = texture(tex, tc);
}