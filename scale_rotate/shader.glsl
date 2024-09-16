@header package scale_rotate
@header import sg"../sokol-odin/sokol/gfx"
@header import glm"core:math/linalg/glsl"
@ctype mat4 glm.mat4

@vs vs

uniform vs_params {
    mat4 transform;
};

in vec4 position;
in vec3 a_color;
in vec2 a_texCoord;

out vec3 o_color;
out vec2 texCoord;

void main() {
    gl_Position = transform * vec4(position.x, position.y, position.z, 1.0);
    o_color = a_color;
    texCoord = a_texCoord;
}
@end

@fs fs
out vec4 FragColor;

in vec3 o_color;
in vec2 texCoord;

uniform texture2D _o_Texture1;
uniform sampler o_Texture1_smp;
#define texture1 sampler2D(_o_Texture1, o_Texture1_smp)
uniform texture2D _o_Texture2;
uniform sampler o_Texture2_smp;
#define texture2 sampler2D(_o_Texture2, o_Texture2_smp)

void main() {
    FragColor = mix(texture(texture1, texCoord), texture(texture2, texCoord), 0.2);
}
@end

@program simple vs fs