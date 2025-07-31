#ifndef TRAIN_GLSL_
#define TRAIN_GLSL_
#include "def.glsl"
UNIFORM_LOC(UNIFORM_EMG_BRAKE) uniform int emgBrake;
UNIFORM_LOC(UNIFORM_SVC_BRAKE) uniform int svcBrake;
UNIFORM_LOC(UNIFORM_BRAKE_NOTCH) uniform int brakeNotch;
UNIFORM_LOC(UNIFORM_POWER_NOTCH) uniform int powerNotch;
UNIFORM_LOC(UNIFORM_REVERSER) uniform int reverser;
UNIFORM_LOC(UNIFORM_PILOT_LAMP) uniform bool pilotlamp;
UNIFORM_LOC(UNIFORM_TRAIN_LOCATION) uniform double trainLocation;
UNIFORM_LOC(UNIFORM_SPEED) uniform float speed;
UNIFORM_LOC(UNIFORM_TRAIN_BC_PRESS) uniform float trainBCpress;
UNIFORM_LOC(UNIFORM_TRAIN_MR_PRESS) uniform float trainMRpress;
UNIFORM_LOC(UNIFORM_TRAIN_ER_PRESS) uniform float trainERpress;
UNIFORM_LOC(UNIFORM_TRAIN_BP_PRESS) uniform float trainBPpress;
UNIFORM_LOC(UNIFORM_TRAIN_SAP_PRESS) uniform float trainSAPpress;
UNIFORM_LOC(UNIFORM_TRAIN_CURRENT) uniform float trainCurrent;

#endif // TRAIN_GLSL_