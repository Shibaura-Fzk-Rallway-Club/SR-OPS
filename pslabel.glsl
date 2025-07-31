#ifndef PS_LABEL_GLSL_
#define PS_LABEL_GLSL_
#include "def.glsl"

UNIFORM_LOC(UNIFORM_LABEL_DIGITS_POS) uniform int labelDigitsPos;

const int labelDigitsCount = 11;
const float pixelSize = 1.0 / float(labelDigitsCount);

int powi(int base, int exp) {
	int result = 1;
	for(int i = 0; i < exp; i++) {
		result *= base;
	}
	return result;
}

int getNumofDigits(int num) {
	int divs = num / powi(10, labelDigitsPos);
	int rem;
	if(divs > 0) {
		rem = divs % 10;
	}
	else {
		if(labelDigitsPos == 0) {
			rem = 0;
		}
		else {
			rem = 10;
		}
	}
    return rem;
}

vec4 offsetLabelPostion(vec4 v, vec2 scale) {
    return v - vec4(scale.x * labelDigitsPos, 0.0, 0.0, 0.0);
}

#endif // PS_LABEL_GLSL_