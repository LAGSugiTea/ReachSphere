#version 150

#moj_import <fog.glsl>

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

in float vertexDistance;

out vec4 fragColor;

void main() {
    float fogMultiplier = vertexDistance < FogEnd ? smoothstep(FogStart, FogEnd, vertexDistance) : 1.0;
    fragColor = vec4(mix( ColorModulator.rgb, FogColor.rgb, fogMultiplier * FogColor.a), ColorModulator.a);
}
