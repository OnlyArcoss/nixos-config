-- rules.lua

-- Supprime les demandes de maximize pour toutes les apps
hl.window_rule({
    name  = "suppress-maximize",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- Fix XWayland : évite le focus parasite sur les fenêtres fantômes
hl.window_rule({
    name       = "fix-xwayland-drags",
    match      = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

-- xwaylandvideobridge : fenêtre invisible de capture d'écran
hl.window_rule({
    name             = "xwayland-video-bridge-fixes",
    match            = { class = "xwaylandvideobridge" },
    opacity          = "0.0 override",
    no_anim          = true,
    no_initial_focus = true,
    no_focus         = true,
    no_blur          = true,
    max_size         = { 1, 1 },
})

-- Transparence de kitty
hl.window_rule({
    match   = { class = "kitty.*" },
    opacity = "0.8 override",
})

hl.window_rule({
    match  = { class = "kitty-float" },
    float  = true,
    size   = { 900, 600 },
    center = true,
})