package shader_uniform

import "core:fmt"

import "base:runtime"
import slog"../sokol-odin/sokol/log"
import sg"../sokol-odin/sokol/gfx"
import sapp"../sokol-odin/sokol/app"
import sglue"../sokol-odin/sokol/glue"

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
        //position      
        0.5,  0.5,  0.0,    
        0.5, -0.5,  0.0, 
       -0.5, -0.5,  0.0, 
       -0.5,  0.5,  0.0, 
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

    state.pip = sg.make_pipeline({
        shader = shader_program,
        index_type = sg.Index_Type.UINT16,
        layout = {
            attrs = {
                ATTR_vs_position = { format = .FLOAT3 },
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
    sg.begin_pass({
        action = state.pass_action,
        swapchain = sglue.swapchain(),
    })

    sg.apply_pipeline(state.pip)
    sg.apply_bindings(state.bind)

    fs_uniform: Fs_Uniform = {
        u_color = {0.2, 0.5, 0.2, 1.0}
    }

    sg.apply_uniforms(sg.Shader_Stage.FS, SLOT_fs_uniform, { ptr = &fs_uniform, size = size_of(fs_uniform)})
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


