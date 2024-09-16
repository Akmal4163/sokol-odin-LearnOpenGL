package scale_rotate

import "core:fmt"

import glm"core:math/linalg/glsl"

import "base:runtime"
import slog"../sokol-odin/sokol/log"
import sg"../sokol-odin/sokol/gfx"
import sapp"../sokol-odin/sokol/app"
import sglue"../sokol-odin/sokol/glue"
import stime "../sokol-odin/sokol/time"
import stbi"vendor:stb/image"
import c"core:c"

state: struct {
    pip: sg.Pipeline,
    bind: sg.Bindings,
    pass_action: sg.Pass_Action,
}

init :: proc "c" () {
    context = runtime.default_context()
    sg.setup({
        environment = sglue.environment(),
        logger = { func = slog.func }
    })

    shader_program := sg.make_shader(simple_shader_desc(sg.query_backend()))

    //vertex buffer and index buffer
    vertices := [?]f32 {
        // positions       // colors        // texture coords
         0.5,  0.5, 0.0,   1.0, 0.0, 0.0,   1.0, 1.0,   // top right
         0.5, -0.5, 0.0,   0.0, 1.0, 0.0,   1.0, 0.0,   // bottom right
        -0.5, -0.5, 0.0,   0.0, 0.0, 1.0,   0.0, 0.0,   // bottom left
        -0.5,  0.5, 0.0,   1.0, 1.0, 0.0,   0.0, 1.0    // top left 
    }

    indices := [?]u16 {
        0, 1, 3,   // first triangle
        1, 2, 3,    // second triangle
    }


    //bind vertex buffer and index buffer
    state.bind.vertex_buffers[0] = sg.make_buffer({
        data = {
            ptr = &vertices,
            size = size_of(vertices),
        },
        label = "quad_vertices",
    })

    state.bind.index_buffer = sg.make_buffer({
        type = sg.Buffer_Type.INDEXBUFFER,
        data = {
            ptr = &indices,
            size = size_of(indices),
        },
        label = "Quad_indices_buffer",
    })

    stbi.set_flip_vertically_on_load(1)
    img_width, img_height, nr_channels : i32
    img_data := stbi.load("container.jpg", &img_width, &img_height, &nr_channels, 4)
    defer stbi.image_free(img_data)

    state.bind.fs.images[SLOT__o_Texture1] = sg.make_image({
        width = img_width,
        height = img_height,
        data = {
            subimage = {
                0 = {
                    0 = { ptr = img_data, size = u64(img_width * img_height * 4) }
                }
            }
        }
    })

    img_data = stbi.load("awesomeface.png", &img_width, &img_height, &nr_channels, 4)
    state.bind.fs.images[SLOT__o_Texture2] = sg.make_image({
        width = img_width,
        height = img_height,
        data = {
            subimage = {
                0 = {
                    0 = { ptr = img_data, size = u64(img_width * img_height * 4) }
                }
            }
        }
    })

    image1 := state.bind.fs.images[SLOT__o_Texture1]
    image2 := state.bind.fs.images[SLOT__o_Texture2]

    state.bind.fs.samplers[SLOT_o_Texture1_smp] = sg.make_sampler(sg.Sampler_Desc {})
    state.bind.fs.samplers[SLOT_o_Texture2_smp] = sg.make_sampler(sg.Sampler_Desc {})

    state.pip = sg.make_pipeline({
        shader = shader_program,
        index_type = sg.Index_Type.UINT16,
        layout = {
            attrs = {
                ATTR_vs_position = { format = .FLOAT3 },
                ATTR_vs_a_color = { format = .FLOAT3 },
                ATTR_vs_a_texCoord = { format = .FLOAT2 }
            },
        },
        label = "quad_pipeline",
    })

    state.pass_action = {
        colors = {
            0 = { 
                load_action = sg.Load_Action.CLEAR,
                clear_value = { r = 0, g = 0, b = 0, a = 1 }, 
            }
        }
    }
}


frame :: proc "c" () {
    context = runtime.default_context()

    rotate := glm.mat4Rotate({0.0, 0.0, 1.0}, glm.radians_f32(cast(f32)stime.sec(stime.now())))
    scale := glm.mat4Scale({0.5, 0.5, 0.5})
    transformed := rotate * scale

    sg.begin_pass({
        action = state.pass_action,
        swapchain = sglue.swapchain(),
    })
    sg.apply_pipeline(state.pip)
    sg.apply_bindings(state.bind)

    vs_params := Vs_Params {
        transform = transformed,
    }

    sg.apply_uniforms(.VS, SLOT_vs_params, { ptr = &vs_params, size = size_of(vs_params)} )
    sg.draw(0, 6, 1)
    sg.end_pass()
    sg.commit()
}

cleanup :: proc "c" () {
    context = runtime.default_context()
    sg.shutdown()
}

main :: proc () {
    sapp.run({
        init_cb = init,
        frame_cb = frame,
        cleanup_cb = cleanup,
        width = 800,
        height = 600,
        window_title = "Sokol Window",
        icon = { sokol_default = false },
        logger = { func = slog.func },
    })
}


