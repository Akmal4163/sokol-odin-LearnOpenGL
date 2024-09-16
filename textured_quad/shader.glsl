@vs vs
in vec4 position;
in vec3 a_color;
in vec2 a_texCoord;

out vec3 o_color;
out vec2 texCoord;

void main() {
    gl_Position = vec4(position.x, position.y, position.z, 1.0);
    o_color = a_color;
    texCoord = a_texCoord;
}
@end

@fs fs
out vec4 FragColor;

in vec3 o_color;
in vec2 texCoord;

uniform texture2D _o_Texture;
uniform sampler o_Texture_smp;

void main() {
    FragColor = texture(sampler2D(_o_Texture, o_Texture_smp), texCoord);
}
@end

@program simple vs fs