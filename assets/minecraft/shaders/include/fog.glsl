#version 150

vec4 linear_fog(vec4 inColor, float vertexDistance, float fogStart, float fogEnd, vec4 fogColor) {
    float fogValue = 0.0;
    if (2.5 <= vertexDistance && vertexDistance <= 3.0) {
        return vec4(vec3(0.0), inColor.a);
    } 
    else {
    return inColor;
    }
}

float linear_fog_fade(float vertexDistance, float fogStart, float fogEnd) {
    if (vertexDistance <= fogStart) {
        return 1.0;
    } else if (vertexDistance >= fogEnd) {
        return 0.0;
    }

    return smoothstep(fogEnd, fogStart, vertexDistance);
}

float fog_distance(mat4 modelViewMat, vec3 pos, int shape) {
        return length((modelViewMat * vec4(pos, 1.0)).xyz);
}
