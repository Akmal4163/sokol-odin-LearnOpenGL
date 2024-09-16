@vs vs

in vec4 position;
in vec3 a_color;

out vec3 o_color;

void main() {
    gl_Position = vec4(position.x, position.y, position.z, 1.0);
    o_color = a_color;
}
@end


@fs fs

in vec3 o_color;
out vec4 FragColor;

void main() {
    FragColor = vec4(o_color, 1.0f);
}
@end


@program simple vs fs