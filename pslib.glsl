#ifndef PSLIB_GLSL_
#define PSLIB_GLSL_
#include "def.glsl"

UNIFORM_LOC(UNIFORM_TEXTURE) uniform sampler2D tex;
UNIFORM_LOC(UNIFORM_BVE_TIME) uniform float bveTime;
UNIFORM_LOC(UNIFORM_BVE_FRAME_TIME) uniform float bveFrameTime;

// --- 関数宣言部 ---
// scaling v4
vec4 scaling1dv4(vec4 v, float scale);
vec4 scaling2dv4(vec4 v, float scale);
vec4 scaling2dv4(vec4 v, float scalex, float scaley);
vec4 scaling2dv4(vec4 v, vec2 scalexy);
vec4 scaling3dv4(vec4 v, float scale);
vec4 scaling3dv4(vec4 v, float scalex, float scaley, float scalez);
vec4 scaling3dv4(vec4 v, float scalex, vec2 scaleyz);
vec4 scaling3dv4(vec4 v, vec2 scalexy, float scalez);
vec4 scaling3dv4(vec4 v, vec3 scalexyz);
vec4 scaling4dv4(vec4 v, float scale);
vec4 scaling4dv4(vec4 v, float scalex, float scaley, float scalez, float scalew);
vec4 scaling4dv4(vec4 v, vec2 scalexy, float scalez, float scalew);
vec4 scaling4dv4(vec4 v, vec3 scalexyz, float scalew);
vec4 scaling4dv4(vec4 v, vec2 scalexy, vec2 scalezw);
vec4 scaling4dv4(vec4 v, vec4 scale);
// scaling v2
vec2 scaling1dv2(vec2 v, float scale);
vec2 scaling2dv2(vec2 v, float scale);
vec2 scaling2dv2(vec2 v, float scalex, float scaley);
vec2 scaling2dv2(vec2 v, vec2 scalexy);
// scaling v3
vec3 scaling1dv3(vec3 v, float scale);
vec3 scaling2dv3(vec3 v, float scale);
vec3 scaling2dv3(vec3 v, float scalex, float scaley);
vec3 scaling2dv3(vec3 v, vec2 scalexy);
vec3 scaling3dv3(vec3 v, float scale);
vec3 scaling3dv3(vec3 v, float scalex, float scaley, float scalez);
vec3 scaling3dv3(vec3 v, vec2 scalexy, float scalez);
vec3 scaling3dv3(vec3 v, vec3 scalexyz);
// div v4
vec4 div1dv4(vec4 v, float div);
vec4 div2dv4(vec4 v, float div);
vec4 div2dv4(vec4 v, float divx, float divy);
vec4 div2dv4(vec4 v, vec2 divxy);
vec4 div3dv4(vec4 v, float div);
vec4 div3dv4(vec4 v, float divx, float divy, float divz);
vec4 div3dv4(vec4 v, float divx, vec2 divyz);
vec4 div3dv4(vec4 v, vec2 divxy, float divz);
vec4 div3dv4(vec4 v, vec3 divxyz);
vec4 div4dv4(vec4 v, float divx, vec3 divyzw);
vec4 div4dv4(vec4 v, float div);
vec4 div4dv4(vec4 v, float divx, float divy, float divz, float divw);
vec4 div4dv4(vec4 v, vec2 divxy, float divz, float divw);
vec4 div4dv4(vec4 v, vec3 divxyz, float divw);
vec4 div4dv4(vec4 v, vec2 divxy, vec2 divzw);
vec4 div4dv4(vec4 v, vec4 divisor);
// div v2
vec2 div1dv2(vec2 v, float div);
vec2 div2dv2(vec2 v, float div);
vec2 div2dv2(vec2 v, float divx, float divy);
vec2 div2dv2(vec2 v, vec2 divxy);
// rotate
vec4 rotatedv4(vec4 v, float angle);
vec4 rotaterv4(vec4 v, float rad);
// --- 関数宣言部ここまで ---

//  1次元スケーリング（x座標のみ）
vec4 scaling1dv4(vec4 v, float scale) {
    return vec4(v.x * scale, v.y, v.z, v.w);
}

//  2次元スケーリング
vec4 scaling2dv4(vec4 v, float scale) {
    return vec4(v.x * scale, v.y * scale, v.z, v.w);
}
vec4 scaling2dv4(vec4 v, float scalex, float scaley) {
    return vec4(v.x * scalex, v.y * scaley, v.z, v.w);
}
vec4 scaling2dv4(vec4 v, vec2 scalexy) {
    return vec4(v.x * scalexy.x, v.y * scalexy.y, v.z, v.w);
}

//  3次元スケーリング
vec4 scaling3dv4(vec4 v, float scale) {
    return vec4(v.x * scale, v.y * scale, v.z * scale, v.w);
}
vec4 scaling3dv4(vec4 v, float scalex, float scaley, float scalez) {
    return vec4(v.x * scalex, v.y * scaley, v.z * scalez, v.w);
}
vec4 scaling3dv4(vec4 v, float scalex, vec2 scaleyz) {
    return vec4(v.x * scalex, v.y * scaleyz.x, v.z * scaleyz.y, v.w);
}
vec4 scaling3dv4(vec4 v, vec2 scalexy, float scalez) {
    return vec4(v.x * scalexy.x, v.y * scalexy.y, v.z * scalez, v.w);
}
vec4 scaling3dv4(vec4 v, vec3 scalexyz) {
    return vec4(v.x * scalexyz.x, v.y * scalexyz.y, v.z * scalexyz.z, v.w);
}

//  4次元スケーリング
vec4 scaling4dv4(vec4 v, float scale) {
    return v * scale;
}
vec4 scaling4dv4(vec4 v, float scalex, float scaley, float scalez, float scalew) {
    return vec4(v.x * scalex, v.y * scaley, v.z * scalez, v.w * scalew);
}
vec4 scaling4dv4(vec4 v, vec2 scalexy, float scalez, float scalew) {
    return vec4(v.x * scalexy.x, v.y * scalexy.y, v.z * scalez, v.w * scalew);
}
vec4 scaling4dv4(vec4 v, vec3 scalexyz, float scalew) {
    return vec4(v.x * scalexyz.x, v.y * scalexyz.y, v.z * scalexyz.z, v.w * scalew);
}
vec4 scaling4dv4(vec4 v, vec2 scalexy, vec2 scalezw) {
    return vec4(v.x * scalexy.x, v.y * scalexy.y, v.z * scalezw.x, v.w * scalezw.y);
}
vec4 scaling4dv4(vec4 v, vec4 scale) {
    return v * scale;
}

//
// Scaling functions - vec2バージョン
//

// 1次元スケーリング（x座標のみ）
vec2 scaling1dv2(vec2 v, float scale) {
    return vec2(v.x * scale, v.y);
}

// 2次元スケーリング
vec2 scaling2dv2(vec2 v, float scale) {
    return v * scale;
}
vec2 scaling2dv2(vec2 v, float scalex, float scaley) {
    return vec2(v.x * scalex, v.y * scaley);
}
vec2 scaling2dv2(vec2 v, vec2 scalexy) {
    return v * scalexy;
}

//
// Scaling functions - vec3バージョン
//

// 1次元スケーリング（x座標のみ）
vec3 scaling1dv3(vec3 v, float scale) {
    return vec3(v.x * scale, v.y, v.z);
}

// 2次元スケーリング（x,y座標）
vec3 scaling2dv3(vec3 v, float scale) {
    return vec3(v.x * scale, v.y * scale, v.z);
}
vec3 scaling2dv3(vec3 v, float scalex, float scaley) {
    return vec3(v.x * scalex, v.y * scaley, v.z);
}
vec3 scaling2dv3(vec3 v, vec2 scalexy) {
    return vec3(v.x * scalexy.x, v.y * scalexy.y, v.z);
}

// 3次元スケーリング
vec3 scaling3dv3(vec3 v, float scale) {
    return v * scale;
}
vec3 scaling3dv3(vec3 v, float scalex, float scaley, float scalez) {
    return vec3(v.x * scalex, v.y * scaley, v.z * scalez);
}
vec3 scaling3dv3(vec3 v, vec2 scalexy, float scalez) {
    return vec3(v.x * scalexy.x, v.y * scalexy.y, v.z * scalez);
}
vec3 scaling3dv3(vec3 v, vec3 scalexyz) {
    return v * scalexyz;
}

//
// vec4バージョン
//

//  座標を引数で割る関数
vec4 div1dv4(vec4 v, float div) {
    return vec4(v.x / div, v.y, v.z, v.w);
}

//  2次元ベクトルまで割る
vec4 div2dv4(vec4 v, float div) {
    return vec4(v.x / div, v.y / div, v.z, v.w);
}
vec4 div2dv4(vec4 v, float divx, float divy) {
    return vec4(v.x / divx, v.y / divy, v.z, v.w);
}
vec4 div2dv4(vec4 v, vec2 divxy) {
    return vec4(v.x / divxy.x, v.y / divxy.y, v.z, v.w);
}

//  3次元ベクトルまで割る
vec4 div3dv4(vec4 v, float div) {
    return vec4(v.x / div, v.y / div, v.z / div, v.w);
}
vec4 div3dv4(vec4 v, float divx, float divy, float divz) {
    return vec4(v.x / divx, v.y / divy, v.z / divz, v.w);
}
vec4 div3dv4(vec4 v, float divx, vec2 divyz) {
    return vec4(v.x / divx, v.y / divyz.x, v.z / divyz.y, v.w);
}
vec4 div3dv4(vec4 v, vec2 divxy, float divz) {
    return vec4(v.x / divxy.x, v.y / divxy.y, v.z / divz, v.w);
}
vec4 div3dv4(vec4 v, vec3 divxyz) {
    return vec4(v.x / divxyz.x, v.y / divxyz.y, v.z / divxyz.z, v.w);
}

// float + vec3
vec4 div4dv4(vec4 v, float divx, vec3 divyzw) {
    return vec4(v.x / divx, v.y / divyzw.x, v.z / divyzw.y, v.w / divyzw.z);
}

// ４次元ベクトルまで割る
vec4 div4dv4(vec4 v, float div) {
    return v / div;
}
vec4 div4dv4(vec4 v, float divx, float divy, float divz, float divw) {
    return vec4(v.x / divx, v.y / divy, v.z / divz, v.w / divw);
}
vec4 div4dv4(vec4 v, vec2 divxy, float divz, float divw) {
    return vec4(v.x / divxy.x, v.y / divxy.y, v.z / divz, v.w / divw);
}
vec4 div4dv4(vec4 v, vec3 divxyz, float divw) {
    return vec4(v.x / divxyz.x, v.y / divxyz.y, v.z / divxyz.z, v.w / divw);
}
vec4 div4dv4(vec4 v, vec2 divxy, vec2 divzw) {
    return vec4(v.x / divxy.x, v.y / divxy.y, v.z / divzw.x, v.w / divzw.y);
}
vec4 div4dv4(vec4 v, vec4 divisor) {
    return v / divisor;
}

//
// vec2バージョン
//

// 1次元
vec2 div1dv2(vec2 v, float div) {
    return vec2(v.x / div, v.y);
}

// 2次元
vec2 div2dv2(vec2 v, float div) {
    return v / div;
}
vec2 div2dv2(vec2 v, float divx, float divy) {
    return vec2(v.x / divx, v.y / divy);
}
vec2 div2dv2(vec2 v, vec2 divxy) {
    return v / divxy;
}

//  座標を回転させる関数
//  angle : 回転角度（度数法）
vec4 rotatedv4(vec4 v, float angle) {
    float rad = radians(angle);
    float vx = v.x * cos(rad) - v.y * sin(rad);
    float vy = v.x * sin(rad) + v.y * cos(rad);
    return vec4(vx, vy, v.z, v.w);
}

//  座標を回転させる関数
//  rad : 回転角度（弧度法）
vec4 rotaterv4(vec4 v, float rad) {
    float vx = v.x * cos(rad) - v.y * sin(rad);
    float vy = v.x * sin(rad) + v.y * cos(rad);
    return vec4(vx, vy, v.z, v.w);
}
#endif // PSLIB_GLSL_