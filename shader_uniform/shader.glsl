@vs vs
in vec4 position;

void main() {
    gl_Position = vec4(position.x, position.y, position.z, 1.0);
}
@end

@fs fs
uniform fs_uniform {
    vec4 u_color;
};
out vec4 FragColor;

void main() {
    FragColor = u_color;
}
@end

@program simple vs fs