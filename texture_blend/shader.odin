package texture_blend

import sg"../sokol-odin/sokol/gfx"

/*
    #version:1# (machine generated, don't edit!)

    Generated by sokol-shdc (https://github.com/floooh/sokol-tools)

    Cmdline:
        sokol-shdc -i shader.glsl -o shader.odin -l glsl430:metal_macos:hlsl5 -f sokol_odin

    Overview:
    =========
    Shader program: 'simple':
        Get shader desc: simple_shader_desc(sg.query_backend())
        Vertex shader: vs
            Attributes:
                ATTR_vs_position => 0
                ATTR_vs_a_color => 1
                ATTR_vs_a_texCoord => 2
        Fragment shader: fs
            Image '_o_Texture':
                Image type: ._2D
                Sample type: .FLOAT
                Multisampled: false
                Bind slot: SLOT__o_Texture => 0
            Sampler 'o_Texture_smp':
                Type: .FILTERING
                Bind slot: SLOT_o_Texture_smp => 0
            Image Sampler Pair '_o_Texture_o_Texture_smp':
                Image: _o_Texture
                Sampler: o_Texture_smp
*/
ATTR_vs_position :: 0
ATTR_vs_a_color :: 1
ATTR_vs_a_texCoord :: 2
SLOT__o_Texture :: 0
SLOT_o_Texture_smp :: 0
/*
    #version 430

    layout(location = 0) in vec4 position;
    layout(location = 0) out vec3 o_color;
    layout(location = 1) in vec3 a_color;
    layout(location = 1) out vec2 texCoord;
    layout(location = 2) in vec2 a_texCoord;

    void main()
    {
        gl_Position = vec4(position.x, position.y, position.z, 1.0);
        o_color = a_color;
        texCoord = a_texCoord;
    }

*/
@(private)
vs_source_glsl430 := [345]u8 {
    0x23,0x76,0x65,0x72,0x73,0x69,0x6f,0x6e,0x20,0x34,0x33,0x30,0x0a,0x0a,0x6c,0x61,
    0x79,0x6f,0x75,0x74,0x28,0x6c,0x6f,0x63,0x61,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,
    0x30,0x29,0x20,0x69,0x6e,0x20,0x76,0x65,0x63,0x34,0x20,0x70,0x6f,0x73,0x69,0x74,
    0x69,0x6f,0x6e,0x3b,0x0a,0x6c,0x61,0x79,0x6f,0x75,0x74,0x28,0x6c,0x6f,0x63,0x61,
    0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,0x30,0x29,0x20,0x6f,0x75,0x74,0x20,0x76,0x65,
    0x63,0x33,0x20,0x6f,0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x6c,0x61,0x79,0x6f,
    0x75,0x74,0x28,0x6c,0x6f,0x63,0x61,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,0x31,0x29,
    0x20,0x69,0x6e,0x20,0x76,0x65,0x63,0x33,0x20,0x61,0x5f,0x63,0x6f,0x6c,0x6f,0x72,
    0x3b,0x0a,0x6c,0x61,0x79,0x6f,0x75,0x74,0x28,0x6c,0x6f,0x63,0x61,0x74,0x69,0x6f,
    0x6e,0x20,0x3d,0x20,0x31,0x29,0x20,0x6f,0x75,0x74,0x20,0x76,0x65,0x63,0x32,0x20,
    0x74,0x65,0x78,0x43,0x6f,0x6f,0x72,0x64,0x3b,0x0a,0x6c,0x61,0x79,0x6f,0x75,0x74,
    0x28,0x6c,0x6f,0x63,0x61,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,0x32,0x29,0x20,0x69,
    0x6e,0x20,0x76,0x65,0x63,0x32,0x20,0x61,0x5f,0x74,0x65,0x78,0x43,0x6f,0x6f,0x72,
    0x64,0x3b,0x0a,0x0a,0x76,0x6f,0x69,0x64,0x20,0x6d,0x61,0x69,0x6e,0x28,0x29,0x0a,
    0x7b,0x0a,0x20,0x20,0x20,0x20,0x67,0x6c,0x5f,0x50,0x6f,0x73,0x69,0x74,0x69,0x6f,
    0x6e,0x20,0x3d,0x20,0x76,0x65,0x63,0x34,0x28,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,
    0x6e,0x2e,0x78,0x2c,0x20,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x2e,0x79,0x2c,
    0x20,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x2e,0x7a,0x2c,0x20,0x31,0x2e,0x30,
    0x29,0x3b,0x0a,0x20,0x20,0x20,0x20,0x6f,0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3d,
    0x20,0x61,0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x20,0x20,0x20,0x20,0x74,0x65,
    0x78,0x43,0x6f,0x6f,0x72,0x64,0x20,0x3d,0x20,0x61,0x5f,0x74,0x65,0x78,0x43,0x6f,
    0x6f,0x72,0x64,0x3b,0x0a,0x7d,0x0a,0x0a,0x00,
}
/*
    #version 430

    layout(binding = 0) uniform sampler2D _o_Texture_o_Texture_smp;

    layout(location = 0) out vec4 FragColor;
    layout(location = 1) in vec2 texCoord;
    layout(location = 0) in vec3 o_color;

    void main()
    {
        FragColor = texture(_o_Texture_o_Texture_smp, texCoord) * vec4(o_color, 1.0);
    }

*/
@(private)
fs_source_glsl430 := [298]u8 {
    0x23,0x76,0x65,0x72,0x73,0x69,0x6f,0x6e,0x20,0x34,0x33,0x30,0x0a,0x0a,0x6c,0x61,
    0x79,0x6f,0x75,0x74,0x28,0x62,0x69,0x6e,0x64,0x69,0x6e,0x67,0x20,0x3d,0x20,0x30,
    0x29,0x20,0x75,0x6e,0x69,0x66,0x6f,0x72,0x6d,0x20,0x73,0x61,0x6d,0x70,0x6c,0x65,
    0x72,0x32,0x44,0x20,0x5f,0x6f,0x5f,0x54,0x65,0x78,0x74,0x75,0x72,0x65,0x5f,0x6f,
    0x5f,0x54,0x65,0x78,0x74,0x75,0x72,0x65,0x5f,0x73,0x6d,0x70,0x3b,0x0a,0x0a,0x6c,
    0x61,0x79,0x6f,0x75,0x74,0x28,0x6c,0x6f,0x63,0x61,0x74,0x69,0x6f,0x6e,0x20,0x3d,
    0x20,0x30,0x29,0x20,0x6f,0x75,0x74,0x20,0x76,0x65,0x63,0x34,0x20,0x46,0x72,0x61,
    0x67,0x43,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x6c,0x61,0x79,0x6f,0x75,0x74,0x28,0x6c,
    0x6f,0x63,0x61,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,0x31,0x29,0x20,0x69,0x6e,0x20,
    0x76,0x65,0x63,0x32,0x20,0x74,0x65,0x78,0x43,0x6f,0x6f,0x72,0x64,0x3b,0x0a,0x6c,
    0x61,0x79,0x6f,0x75,0x74,0x28,0x6c,0x6f,0x63,0x61,0x74,0x69,0x6f,0x6e,0x20,0x3d,
    0x20,0x30,0x29,0x20,0x69,0x6e,0x20,0x76,0x65,0x63,0x33,0x20,0x6f,0x5f,0x63,0x6f,
    0x6c,0x6f,0x72,0x3b,0x0a,0x0a,0x76,0x6f,0x69,0x64,0x20,0x6d,0x61,0x69,0x6e,0x28,
    0x29,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x46,0x72,0x61,0x67,0x43,0x6f,0x6c,0x6f,
    0x72,0x20,0x3d,0x20,0x74,0x65,0x78,0x74,0x75,0x72,0x65,0x28,0x5f,0x6f,0x5f,0x54,
    0x65,0x78,0x74,0x75,0x72,0x65,0x5f,0x6f,0x5f,0x54,0x65,0x78,0x74,0x75,0x72,0x65,
    0x5f,0x73,0x6d,0x70,0x2c,0x20,0x74,0x65,0x78,0x43,0x6f,0x6f,0x72,0x64,0x29,0x20,
    0x2a,0x20,0x76,0x65,0x63,0x34,0x28,0x6f,0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x2c,0x20,
    0x31,0x2e,0x30,0x29,0x3b,0x0a,0x7d,0x0a,0x0a,0x00,
}
/*
    static float4 gl_Position;
    static float4 position;
    static float3 o_color;
    static float3 a_color;
    static float2 texCoord;
    static float2 a_texCoord;

    struct SPIRV_Cross_Input
    {
        float4 position : TEXCOORD0;
        float3 a_color : TEXCOORD1;
        float2 a_texCoord : TEXCOORD2;
    };

    struct SPIRV_Cross_Output
    {
        float3 o_color : TEXCOORD0;
        float2 texCoord : TEXCOORD1;
        float4 gl_Position : SV_Position;
    };

    void vert_main()
    {
        gl_Position = float4(position.x, position.y, position.z, 1.0f);
        o_color = a_color;
        texCoord = a_texCoord;
    }

    SPIRV_Cross_Output main(SPIRV_Cross_Input stage_input)
    {
        position = stage_input.position;
        a_color = stage_input.a_color;
        a_texCoord = stage_input.a_texCoord;
        vert_main();
        SPIRV_Cross_Output stage_output;
        stage_output.gl_Position = gl_Position;
        stage_output.o_color = o_color;
        stage_output.texCoord = texCoord;
        return stage_output;
    }
*/
@(private)
vs_source_hlsl5 := [924]u8 {
    0x73,0x74,0x61,0x74,0x69,0x63,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x67,0x6c,
    0x5f,0x50,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x3b,0x0a,0x73,0x74,0x61,0x74,0x69,
    0x63,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,
    0x6e,0x3b,0x0a,0x73,0x74,0x61,0x74,0x69,0x63,0x20,0x66,0x6c,0x6f,0x61,0x74,0x33,
    0x20,0x6f,0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x73,0x74,0x61,0x74,0x69,0x63,
    0x20,0x66,0x6c,0x6f,0x61,0x74,0x33,0x20,0x61,0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x3b,
    0x0a,0x73,0x74,0x61,0x74,0x69,0x63,0x20,0x66,0x6c,0x6f,0x61,0x74,0x32,0x20,0x74,
    0x65,0x78,0x43,0x6f,0x6f,0x72,0x64,0x3b,0x0a,0x73,0x74,0x61,0x74,0x69,0x63,0x20,
    0x66,0x6c,0x6f,0x61,0x74,0x32,0x20,0x61,0x5f,0x74,0x65,0x78,0x43,0x6f,0x6f,0x72,
    0x64,0x3b,0x0a,0x0a,0x73,0x74,0x72,0x75,0x63,0x74,0x20,0x53,0x50,0x49,0x52,0x56,
    0x5f,0x43,0x72,0x6f,0x73,0x73,0x5f,0x49,0x6e,0x70,0x75,0x74,0x0a,0x7b,0x0a,0x20,
    0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x70,0x6f,0x73,0x69,0x74,0x69,
    0x6f,0x6e,0x20,0x3a,0x20,0x54,0x45,0x58,0x43,0x4f,0x4f,0x52,0x44,0x30,0x3b,0x0a,
    0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x33,0x20,0x61,0x5f,0x63,0x6f,0x6c,
    0x6f,0x72,0x20,0x3a,0x20,0x54,0x45,0x58,0x43,0x4f,0x4f,0x52,0x44,0x31,0x3b,0x0a,
    0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x32,0x20,0x61,0x5f,0x74,0x65,0x78,
    0x43,0x6f,0x6f,0x72,0x64,0x20,0x3a,0x20,0x54,0x45,0x58,0x43,0x4f,0x4f,0x52,0x44,
    0x32,0x3b,0x0a,0x7d,0x3b,0x0a,0x0a,0x73,0x74,0x72,0x75,0x63,0x74,0x20,0x53,0x50,
    0x49,0x52,0x56,0x5f,0x43,0x72,0x6f,0x73,0x73,0x5f,0x4f,0x75,0x74,0x70,0x75,0x74,
    0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x33,0x20,0x6f,0x5f,
    0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3a,0x20,0x54,0x45,0x58,0x43,0x4f,0x4f,0x52,0x44,
    0x30,0x3b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x32,0x20,0x74,0x65,
    0x78,0x43,0x6f,0x6f,0x72,0x64,0x20,0x3a,0x20,0x54,0x45,0x58,0x43,0x4f,0x4f,0x52,
    0x44,0x31,0x3b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x67,
    0x6c,0x5f,0x50,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x20,0x3a,0x20,0x53,0x56,0x5f,
    0x50,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x3b,0x0a,0x7d,0x3b,0x0a,0x0a,0x76,0x6f,
    0x69,0x64,0x20,0x76,0x65,0x72,0x74,0x5f,0x6d,0x61,0x69,0x6e,0x28,0x29,0x0a,0x7b,
    0x0a,0x20,0x20,0x20,0x20,0x67,0x6c,0x5f,0x50,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,
    0x20,0x3d,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x28,0x70,0x6f,0x73,0x69,0x74,0x69,
    0x6f,0x6e,0x2e,0x78,0x2c,0x20,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x2e,0x79,
    0x2c,0x20,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x2e,0x7a,0x2c,0x20,0x31,0x2e,
    0x30,0x66,0x29,0x3b,0x0a,0x20,0x20,0x20,0x20,0x6f,0x5f,0x63,0x6f,0x6c,0x6f,0x72,
    0x20,0x3d,0x20,0x61,0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x20,0x20,0x20,0x20,
    0x74,0x65,0x78,0x43,0x6f,0x6f,0x72,0x64,0x20,0x3d,0x20,0x61,0x5f,0x74,0x65,0x78,
    0x43,0x6f,0x6f,0x72,0x64,0x3b,0x0a,0x7d,0x0a,0x0a,0x53,0x50,0x49,0x52,0x56,0x5f,
    0x43,0x72,0x6f,0x73,0x73,0x5f,0x4f,0x75,0x74,0x70,0x75,0x74,0x20,0x6d,0x61,0x69,
    0x6e,0x28,0x53,0x50,0x49,0x52,0x56,0x5f,0x43,0x72,0x6f,0x73,0x73,0x5f,0x49,0x6e,
    0x70,0x75,0x74,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,0x69,0x6e,0x70,0x75,0x74,0x29,
    0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x20,
    0x3d,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,0x69,0x6e,0x70,0x75,0x74,0x2e,0x70,0x6f,
    0x73,0x69,0x74,0x69,0x6f,0x6e,0x3b,0x0a,0x20,0x20,0x20,0x20,0x61,0x5f,0x63,0x6f,
    0x6c,0x6f,0x72,0x20,0x3d,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,0x69,0x6e,0x70,0x75,
    0x74,0x2e,0x61,0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x20,0x20,0x20,0x20,0x61,
    0x5f,0x74,0x65,0x78,0x43,0x6f,0x6f,0x72,0x64,0x20,0x3d,0x20,0x73,0x74,0x61,0x67,
    0x65,0x5f,0x69,0x6e,0x70,0x75,0x74,0x2e,0x61,0x5f,0x74,0x65,0x78,0x43,0x6f,0x6f,
    0x72,0x64,0x3b,0x0a,0x20,0x20,0x20,0x20,0x76,0x65,0x72,0x74,0x5f,0x6d,0x61,0x69,
    0x6e,0x28,0x29,0x3b,0x0a,0x20,0x20,0x20,0x20,0x53,0x50,0x49,0x52,0x56,0x5f,0x43,
    0x72,0x6f,0x73,0x73,0x5f,0x4f,0x75,0x74,0x70,0x75,0x74,0x20,0x73,0x74,0x61,0x67,
    0x65,0x5f,0x6f,0x75,0x74,0x70,0x75,0x74,0x3b,0x0a,0x20,0x20,0x20,0x20,0x73,0x74,
    0x61,0x67,0x65,0x5f,0x6f,0x75,0x74,0x70,0x75,0x74,0x2e,0x67,0x6c,0x5f,0x50,0x6f,
    0x73,0x69,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,0x67,0x6c,0x5f,0x50,0x6f,0x73,0x69,
    0x74,0x69,0x6f,0x6e,0x3b,0x0a,0x20,0x20,0x20,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,
    0x6f,0x75,0x74,0x70,0x75,0x74,0x2e,0x6f,0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3d,
    0x20,0x6f,0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x20,0x20,0x20,0x20,0x73,0x74,
    0x61,0x67,0x65,0x5f,0x6f,0x75,0x74,0x70,0x75,0x74,0x2e,0x74,0x65,0x78,0x43,0x6f,
    0x6f,0x72,0x64,0x20,0x3d,0x20,0x74,0x65,0x78,0x43,0x6f,0x6f,0x72,0x64,0x3b,0x0a,
    0x20,0x20,0x20,0x20,0x72,0x65,0x74,0x75,0x72,0x6e,0x20,0x73,0x74,0x61,0x67,0x65,
    0x5f,0x6f,0x75,0x74,0x70,0x75,0x74,0x3b,0x0a,0x7d,0x0a,0x00,
}
/*
    Texture2D<float4> _o_Texture : register(t0);
    SamplerState o_Texture_smp : register(s0);

    static float4 FragColor;
    static float2 texCoord;
    static float3 o_color;

    struct SPIRV_Cross_Input
    {
        float3 o_color : TEXCOORD0;
        float2 texCoord : TEXCOORD1;
    };

    struct SPIRV_Cross_Output
    {
        float4 FragColor : SV_Target0;
    };

    void frag_main()
    {
        FragColor = _o_Texture.Sample(o_Texture_smp, texCoord) * float4(o_color, 1.0f);
    }

    SPIRV_Cross_Output main(SPIRV_Cross_Input stage_input)
    {
        texCoord = stage_input.texCoord;
        o_color = stage_input.o_color;
        frag_main();
        SPIRV_Cross_Output stage_output;
        stage_output.FragColor = FragColor;
        return stage_output;
    }
*/
@(private)
fs_source_hlsl5 := [682]u8 {
    0x54,0x65,0x78,0x74,0x75,0x72,0x65,0x32,0x44,0x3c,0x66,0x6c,0x6f,0x61,0x74,0x34,
    0x3e,0x20,0x5f,0x6f,0x5f,0x54,0x65,0x78,0x74,0x75,0x72,0x65,0x20,0x3a,0x20,0x72,
    0x65,0x67,0x69,0x73,0x74,0x65,0x72,0x28,0x74,0x30,0x29,0x3b,0x0a,0x53,0x61,0x6d,
    0x70,0x6c,0x65,0x72,0x53,0x74,0x61,0x74,0x65,0x20,0x6f,0x5f,0x54,0x65,0x78,0x74,
    0x75,0x72,0x65,0x5f,0x73,0x6d,0x70,0x20,0x3a,0x20,0x72,0x65,0x67,0x69,0x73,0x74,
    0x65,0x72,0x28,0x73,0x30,0x29,0x3b,0x0a,0x0a,0x73,0x74,0x61,0x74,0x69,0x63,0x20,
    0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x46,0x72,0x61,0x67,0x43,0x6f,0x6c,0x6f,0x72,
    0x3b,0x0a,0x73,0x74,0x61,0x74,0x69,0x63,0x20,0x66,0x6c,0x6f,0x61,0x74,0x32,0x20,
    0x74,0x65,0x78,0x43,0x6f,0x6f,0x72,0x64,0x3b,0x0a,0x73,0x74,0x61,0x74,0x69,0x63,
    0x20,0x66,0x6c,0x6f,0x61,0x74,0x33,0x20,0x6f,0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x3b,
    0x0a,0x0a,0x73,0x74,0x72,0x75,0x63,0x74,0x20,0x53,0x50,0x49,0x52,0x56,0x5f,0x43,
    0x72,0x6f,0x73,0x73,0x5f,0x49,0x6e,0x70,0x75,0x74,0x0a,0x7b,0x0a,0x20,0x20,0x20,
    0x20,0x66,0x6c,0x6f,0x61,0x74,0x33,0x20,0x6f,0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x20,
    0x3a,0x20,0x54,0x45,0x58,0x43,0x4f,0x4f,0x52,0x44,0x30,0x3b,0x0a,0x20,0x20,0x20,
    0x20,0x66,0x6c,0x6f,0x61,0x74,0x32,0x20,0x74,0x65,0x78,0x43,0x6f,0x6f,0x72,0x64,
    0x20,0x3a,0x20,0x54,0x45,0x58,0x43,0x4f,0x4f,0x52,0x44,0x31,0x3b,0x0a,0x7d,0x3b,
    0x0a,0x0a,0x73,0x74,0x72,0x75,0x63,0x74,0x20,0x53,0x50,0x49,0x52,0x56,0x5f,0x43,
    0x72,0x6f,0x73,0x73,0x5f,0x4f,0x75,0x74,0x70,0x75,0x74,0x0a,0x7b,0x0a,0x20,0x20,
    0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x46,0x72,0x61,0x67,0x43,0x6f,0x6c,
    0x6f,0x72,0x20,0x3a,0x20,0x53,0x56,0x5f,0x54,0x61,0x72,0x67,0x65,0x74,0x30,0x3b,
    0x0a,0x7d,0x3b,0x0a,0x0a,0x76,0x6f,0x69,0x64,0x20,0x66,0x72,0x61,0x67,0x5f,0x6d,
    0x61,0x69,0x6e,0x28,0x29,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x46,0x72,0x61,0x67,
    0x43,0x6f,0x6c,0x6f,0x72,0x20,0x3d,0x20,0x5f,0x6f,0x5f,0x54,0x65,0x78,0x74,0x75,
    0x72,0x65,0x2e,0x53,0x61,0x6d,0x70,0x6c,0x65,0x28,0x6f,0x5f,0x54,0x65,0x78,0x74,
    0x75,0x72,0x65,0x5f,0x73,0x6d,0x70,0x2c,0x20,0x74,0x65,0x78,0x43,0x6f,0x6f,0x72,
    0x64,0x29,0x20,0x2a,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x28,0x6f,0x5f,0x63,0x6f,
    0x6c,0x6f,0x72,0x2c,0x20,0x31,0x2e,0x30,0x66,0x29,0x3b,0x0a,0x7d,0x0a,0x0a,0x53,
    0x50,0x49,0x52,0x56,0x5f,0x43,0x72,0x6f,0x73,0x73,0x5f,0x4f,0x75,0x74,0x70,0x75,
    0x74,0x20,0x6d,0x61,0x69,0x6e,0x28,0x53,0x50,0x49,0x52,0x56,0x5f,0x43,0x72,0x6f,
    0x73,0x73,0x5f,0x49,0x6e,0x70,0x75,0x74,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,0x69,
    0x6e,0x70,0x75,0x74,0x29,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x74,0x65,0x78,0x43,
    0x6f,0x6f,0x72,0x64,0x20,0x3d,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,0x69,0x6e,0x70,
    0x75,0x74,0x2e,0x74,0x65,0x78,0x43,0x6f,0x6f,0x72,0x64,0x3b,0x0a,0x20,0x20,0x20,
    0x20,0x6f,0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3d,0x20,0x73,0x74,0x61,0x67,0x65,
    0x5f,0x69,0x6e,0x70,0x75,0x74,0x2e,0x6f,0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,
    0x20,0x20,0x20,0x20,0x66,0x72,0x61,0x67,0x5f,0x6d,0x61,0x69,0x6e,0x28,0x29,0x3b,
    0x0a,0x20,0x20,0x20,0x20,0x53,0x50,0x49,0x52,0x56,0x5f,0x43,0x72,0x6f,0x73,0x73,
    0x5f,0x4f,0x75,0x74,0x70,0x75,0x74,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,0x6f,0x75,
    0x74,0x70,0x75,0x74,0x3b,0x0a,0x20,0x20,0x20,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,
    0x6f,0x75,0x74,0x70,0x75,0x74,0x2e,0x46,0x72,0x61,0x67,0x43,0x6f,0x6c,0x6f,0x72,
    0x20,0x3d,0x20,0x46,0x72,0x61,0x67,0x43,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x20,0x20,
    0x20,0x20,0x72,0x65,0x74,0x75,0x72,0x6e,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,0x6f,
    0x75,0x74,0x70,0x75,0x74,0x3b,0x0a,0x7d,0x0a,0x00,
}
/*
    #include <metal_stdlib>
    #include <simd/simd.h>

    using namespace metal;

    struct main0_out
    {
        float3 o_color [[user(locn0)]];
        float2 texCoord [[user(locn1)]];
        float4 gl_Position [[position]];
    };

    struct main0_in
    {
        float4 position [[attribute(0)]];
        float3 a_color [[attribute(1)]];
        float2 a_texCoord [[attribute(2)]];
    };

    vertex main0_out main0(main0_in in [[stage_in]])
    {
        main0_out out = {};
        out.gl_Position = float4(in.position.x, in.position.y, in.position.z, 1.0);
        out.o_color = in.a_color;
        out.texCoord = in.a_texCoord;
        return out;
    }

*/
@(private)
vs_source_metal_macos := [581]u8 {
    0x23,0x69,0x6e,0x63,0x6c,0x75,0x64,0x65,0x20,0x3c,0x6d,0x65,0x74,0x61,0x6c,0x5f,
    0x73,0x74,0x64,0x6c,0x69,0x62,0x3e,0x0a,0x23,0x69,0x6e,0x63,0x6c,0x75,0x64,0x65,
    0x20,0x3c,0x73,0x69,0x6d,0x64,0x2f,0x73,0x69,0x6d,0x64,0x2e,0x68,0x3e,0x0a,0x0a,
    0x75,0x73,0x69,0x6e,0x67,0x20,0x6e,0x61,0x6d,0x65,0x73,0x70,0x61,0x63,0x65,0x20,
    0x6d,0x65,0x74,0x61,0x6c,0x3b,0x0a,0x0a,0x73,0x74,0x72,0x75,0x63,0x74,0x20,0x6d,
    0x61,0x69,0x6e,0x30,0x5f,0x6f,0x75,0x74,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,
    0x6c,0x6f,0x61,0x74,0x33,0x20,0x6f,0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x5b,0x5b,
    0x75,0x73,0x65,0x72,0x28,0x6c,0x6f,0x63,0x6e,0x30,0x29,0x5d,0x5d,0x3b,0x0a,0x20,
    0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x32,0x20,0x74,0x65,0x78,0x43,0x6f,0x6f,
    0x72,0x64,0x20,0x5b,0x5b,0x75,0x73,0x65,0x72,0x28,0x6c,0x6f,0x63,0x6e,0x31,0x29,
    0x5d,0x5d,0x3b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x67,
    0x6c,0x5f,0x50,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x20,0x5b,0x5b,0x70,0x6f,0x73,
    0x69,0x74,0x69,0x6f,0x6e,0x5d,0x5d,0x3b,0x0a,0x7d,0x3b,0x0a,0x0a,0x73,0x74,0x72,
    0x75,0x63,0x74,0x20,0x6d,0x61,0x69,0x6e,0x30,0x5f,0x69,0x6e,0x0a,0x7b,0x0a,0x20,
    0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x70,0x6f,0x73,0x69,0x74,0x69,
    0x6f,0x6e,0x20,0x5b,0x5b,0x61,0x74,0x74,0x72,0x69,0x62,0x75,0x74,0x65,0x28,0x30,
    0x29,0x5d,0x5d,0x3b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x33,0x20,
    0x61,0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x5b,0x5b,0x61,0x74,0x74,0x72,0x69,0x62,
    0x75,0x74,0x65,0x28,0x31,0x29,0x5d,0x5d,0x3b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,
    0x6f,0x61,0x74,0x32,0x20,0x61,0x5f,0x74,0x65,0x78,0x43,0x6f,0x6f,0x72,0x64,0x20,
    0x5b,0x5b,0x61,0x74,0x74,0x72,0x69,0x62,0x75,0x74,0x65,0x28,0x32,0x29,0x5d,0x5d,
    0x3b,0x0a,0x7d,0x3b,0x0a,0x0a,0x76,0x65,0x72,0x74,0x65,0x78,0x20,0x6d,0x61,0x69,
    0x6e,0x30,0x5f,0x6f,0x75,0x74,0x20,0x6d,0x61,0x69,0x6e,0x30,0x28,0x6d,0x61,0x69,
    0x6e,0x30,0x5f,0x69,0x6e,0x20,0x69,0x6e,0x20,0x5b,0x5b,0x73,0x74,0x61,0x67,0x65,
    0x5f,0x69,0x6e,0x5d,0x5d,0x29,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x6d,0x61,0x69,
    0x6e,0x30,0x5f,0x6f,0x75,0x74,0x20,0x6f,0x75,0x74,0x20,0x3d,0x20,0x7b,0x7d,0x3b,
    0x0a,0x20,0x20,0x20,0x20,0x6f,0x75,0x74,0x2e,0x67,0x6c,0x5f,0x50,0x6f,0x73,0x69,
    0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x28,0x69,0x6e,
    0x2e,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x2e,0x78,0x2c,0x20,0x69,0x6e,0x2e,
    0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x2e,0x79,0x2c,0x20,0x69,0x6e,0x2e,0x70,
    0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x2e,0x7a,0x2c,0x20,0x31,0x2e,0x30,0x29,0x3b,
    0x0a,0x20,0x20,0x20,0x20,0x6f,0x75,0x74,0x2e,0x6f,0x5f,0x63,0x6f,0x6c,0x6f,0x72,
    0x20,0x3d,0x20,0x69,0x6e,0x2e,0x61,0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x20,
    0x20,0x20,0x20,0x6f,0x75,0x74,0x2e,0x74,0x65,0x78,0x43,0x6f,0x6f,0x72,0x64,0x20,
    0x3d,0x20,0x69,0x6e,0x2e,0x61,0x5f,0x74,0x65,0x78,0x43,0x6f,0x6f,0x72,0x64,0x3b,
    0x0a,0x20,0x20,0x20,0x20,0x72,0x65,0x74,0x75,0x72,0x6e,0x20,0x6f,0x75,0x74,0x3b,
    0x0a,0x7d,0x0a,0x0a,0x00,
}
/*
    #include <metal_stdlib>
    #include <simd/simd.h>

    using namespace metal;

    struct main0_out
    {
        float4 FragColor [[color(0)]];
    };

    struct main0_in
    {
        float3 o_color [[user(locn0)]];
        float2 texCoord [[user(locn1)]];
    };

    fragment main0_out main0(main0_in in [[stage_in]], texture2d<float> _o_Texture [[texture(0)]], sampler o_Texture_smp [[sampler(0)]])
    {
        main0_out out = {};
        out.FragColor = _o_Texture.sample(o_Texture_smp, in.texCoord) * float4(in.o_color, 1.0);
        return out;
    }

*/
@(private)
fs_source_metal_macos := [497]u8 {
    0x23,0x69,0x6e,0x63,0x6c,0x75,0x64,0x65,0x20,0x3c,0x6d,0x65,0x74,0x61,0x6c,0x5f,
    0x73,0x74,0x64,0x6c,0x69,0x62,0x3e,0x0a,0x23,0x69,0x6e,0x63,0x6c,0x75,0x64,0x65,
    0x20,0x3c,0x73,0x69,0x6d,0x64,0x2f,0x73,0x69,0x6d,0x64,0x2e,0x68,0x3e,0x0a,0x0a,
    0x75,0x73,0x69,0x6e,0x67,0x20,0x6e,0x61,0x6d,0x65,0x73,0x70,0x61,0x63,0x65,0x20,
    0x6d,0x65,0x74,0x61,0x6c,0x3b,0x0a,0x0a,0x73,0x74,0x72,0x75,0x63,0x74,0x20,0x6d,
    0x61,0x69,0x6e,0x30,0x5f,0x6f,0x75,0x74,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,
    0x6c,0x6f,0x61,0x74,0x34,0x20,0x46,0x72,0x61,0x67,0x43,0x6f,0x6c,0x6f,0x72,0x20,
    0x5b,0x5b,0x63,0x6f,0x6c,0x6f,0x72,0x28,0x30,0x29,0x5d,0x5d,0x3b,0x0a,0x7d,0x3b,
    0x0a,0x0a,0x73,0x74,0x72,0x75,0x63,0x74,0x20,0x6d,0x61,0x69,0x6e,0x30,0x5f,0x69,
    0x6e,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x33,0x20,0x6f,
    0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x5b,0x5b,0x75,0x73,0x65,0x72,0x28,0x6c,0x6f,
    0x63,0x6e,0x30,0x29,0x5d,0x5d,0x3b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,
    0x74,0x32,0x20,0x74,0x65,0x78,0x43,0x6f,0x6f,0x72,0x64,0x20,0x5b,0x5b,0x75,0x73,
    0x65,0x72,0x28,0x6c,0x6f,0x63,0x6e,0x31,0x29,0x5d,0x5d,0x3b,0x0a,0x7d,0x3b,0x0a,
    0x0a,0x66,0x72,0x61,0x67,0x6d,0x65,0x6e,0x74,0x20,0x6d,0x61,0x69,0x6e,0x30,0x5f,
    0x6f,0x75,0x74,0x20,0x6d,0x61,0x69,0x6e,0x30,0x28,0x6d,0x61,0x69,0x6e,0x30,0x5f,
    0x69,0x6e,0x20,0x69,0x6e,0x20,0x5b,0x5b,0x73,0x74,0x61,0x67,0x65,0x5f,0x69,0x6e,
    0x5d,0x5d,0x2c,0x20,0x74,0x65,0x78,0x74,0x75,0x72,0x65,0x32,0x64,0x3c,0x66,0x6c,
    0x6f,0x61,0x74,0x3e,0x20,0x5f,0x6f,0x5f,0x54,0x65,0x78,0x74,0x75,0x72,0x65,0x20,
    0x5b,0x5b,0x74,0x65,0x78,0x74,0x75,0x72,0x65,0x28,0x30,0x29,0x5d,0x5d,0x2c,0x20,
    0x73,0x61,0x6d,0x70,0x6c,0x65,0x72,0x20,0x6f,0x5f,0x54,0x65,0x78,0x74,0x75,0x72,
    0x65,0x5f,0x73,0x6d,0x70,0x20,0x5b,0x5b,0x73,0x61,0x6d,0x70,0x6c,0x65,0x72,0x28,
    0x30,0x29,0x5d,0x5d,0x29,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x6d,0x61,0x69,0x6e,
    0x30,0x5f,0x6f,0x75,0x74,0x20,0x6f,0x75,0x74,0x20,0x3d,0x20,0x7b,0x7d,0x3b,0x0a,
    0x20,0x20,0x20,0x20,0x6f,0x75,0x74,0x2e,0x46,0x72,0x61,0x67,0x43,0x6f,0x6c,0x6f,
    0x72,0x20,0x3d,0x20,0x5f,0x6f,0x5f,0x54,0x65,0x78,0x74,0x75,0x72,0x65,0x2e,0x73,
    0x61,0x6d,0x70,0x6c,0x65,0x28,0x6f,0x5f,0x54,0x65,0x78,0x74,0x75,0x72,0x65,0x5f,
    0x73,0x6d,0x70,0x2c,0x20,0x69,0x6e,0x2e,0x74,0x65,0x78,0x43,0x6f,0x6f,0x72,0x64,
    0x29,0x20,0x2a,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x28,0x69,0x6e,0x2e,0x6f,0x5f,
    0x63,0x6f,0x6c,0x6f,0x72,0x2c,0x20,0x31,0x2e,0x30,0x29,0x3b,0x0a,0x20,0x20,0x20,
    0x20,0x72,0x65,0x74,0x75,0x72,0x6e,0x20,0x6f,0x75,0x74,0x3b,0x0a,0x7d,0x0a,0x0a,
    0x00,
}
simple_shader_desc :: proc (backend: sg.Backend) -> sg.Shader_Desc {
    desc: sg.Shader_Desc
    desc.label = "simple_shader"
    #partial switch backend {
    case .GLCORE:
        desc.attrs[0].name = "position"
        desc.attrs[1].name = "a_color"
        desc.attrs[2].name = "a_texCoord"
        desc.vs.source = transmute(cstring)&vs_source_glsl430
        desc.vs.entry = "main"
        desc.fs.source = transmute(cstring)&fs_source_glsl430
        desc.fs.entry = "main"
        desc.fs.images[0].used = true
        desc.fs.images[0].multisampled = false
        desc.fs.images[0].image_type = ._2D
        desc.fs.images[0].sample_type = .FLOAT
        desc.fs.samplers[0].used = true
        desc.fs.samplers[0].sampler_type = .FILTERING
        desc.fs.image_sampler_pairs[0].used = true
        desc.fs.image_sampler_pairs[0].image_slot = 0
        desc.fs.image_sampler_pairs[0].sampler_slot = 0
        desc.fs.image_sampler_pairs[0].glsl_name = "_o_Texture_o_Texture_smp"
    case .D3D11:
        desc.attrs[0].sem_name = "TEXCOORD"
        desc.attrs[0].sem_index = 0
        desc.attrs[1].sem_name = "TEXCOORD"
        desc.attrs[1].sem_index = 1
        desc.attrs[2].sem_name = "TEXCOORD"
        desc.attrs[2].sem_index = 2
        desc.vs.source = transmute(cstring)&vs_source_hlsl5
        desc.vs.d3d11_target = "vs_5_0"
        desc.vs.entry = "main"
        desc.fs.source = transmute(cstring)&fs_source_hlsl5
        desc.fs.d3d11_target = "ps_5_0"
        desc.fs.entry = "main"
        desc.fs.images[0].used = true
        desc.fs.images[0].multisampled = false
        desc.fs.images[0].image_type = ._2D
        desc.fs.images[0].sample_type = .FLOAT
        desc.fs.samplers[0].used = true
        desc.fs.samplers[0].sampler_type = .FILTERING
        desc.fs.image_sampler_pairs[0].used = true
        desc.fs.image_sampler_pairs[0].image_slot = 0
        desc.fs.image_sampler_pairs[0].sampler_slot = 0
    case .METAL_MACOS:
        desc.vs.source = transmute(cstring)&vs_source_metal_macos
        desc.vs.entry = "main0"
        desc.fs.source = transmute(cstring)&fs_source_metal_macos
        desc.fs.entry = "main0"
        desc.fs.images[0].used = true
        desc.fs.images[0].multisampled = false
        desc.fs.images[0].image_type = ._2D
        desc.fs.images[0].sample_type = .FLOAT
        desc.fs.samplers[0].used = true
        desc.fs.samplers[0].sampler_type = .FILTERING
        desc.fs.image_sampler_pairs[0].used = true
        desc.fs.image_sampler_pairs[0].image_slot = 0
        desc.fs.image_sampler_pairs[0].sampler_slot = 0
    }
    return desc
}
