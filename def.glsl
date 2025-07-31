#ifndef DEF_GLSL_
#define DEF_GLSL_

// Uniform location helper macro
#define UNIFORM_LOC(_x) layout(location = _x)

// Uniform locations
#define UNIFORM_TEXTURE 0          // sampler2D tex
#define UNIFORM_WINDOW_SIZE 1      // vec2 windowSize 
#define UNIFORM_WINDOW_SCALE 2     // float windowScale
#define UNIFORM_OBJECT_SCALE 3     // vec2 ObjectScale
#define UNIFORM_OBJECT_GEOMETRY 4  // vec2 ObjectGeometry
#define UNIFORM_OBJECT_POSITION 5  // vec2 ObjectPosition
#define UNIFORM_EMG_BRAKE 6        // int emgBrake
#define UNIFORM_SVC_BRAKE 7        // int svcBrake
#define UNIFORM_BRAKE_NOTCH 8      // int brakeNotch
#define UNIFORM_POWER_NOTCH 9      // int powerNotch
#define UNIFORM_REVERSER 10        // int reverser
#define UNIFORM_PILOT_LAMP 11      // bool pilotlamp
#define UNIFORM_TRAIN_LOCATION 12  // double trainLocation
#define UNIFORM_SPEED 13           // float speed
#define UNIFORM_TRAIN_BC_PRESS 14  // float trainBCpress
#define UNIFORM_TRAIN_MR_PRESS 15  // float trainMRpress
#define UNIFORM_TRAIN_ER_PRESS 16  // float trainERpress
#define UNIFORM_TRAIN_BP_PRESS 17  // float trainBPpress
#define UNIFORM_TRAIN_SAP_PRESS 18 // float trainSAPpress
#define UNIFORM_TRAIN_CURRENT 19   // float trainCurrent
#define UNIFORM_BVE_TIME 20        // float bveTime
#define UNIFORM_BVE_FRAME_TIME 21  // float bveFrameTime
#define UNIFORM_LABEL_DIGITS_POS 22 // int labelDigitsPos

#endif // DEF_GLSL_