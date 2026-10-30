-- Translated from hyprland.conf (hyprlang) to the Hyprland 0.57 Lua config.
-- See https://wiki.hypr.land/configuring/

-- Setup monitors
-- See https://wiki.hypr.land/configuring/core/monitors/
hl.monitor({ output = "eDP-1",    mode = "1920x1200@60", position = "0x0",       scale = 1 })
hl.monitor({ output = "DP-1",     mode = "2560x1440@60", position = "1920x-240", scale = 1 })
-- hl.monitor({ output = "DP-6",  mode = "1920x1080@60", position = "2560x-1440", scale = 1 })
hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@60", position = "4480x0",    scale = 1 })
hl.monitor({ output = "",         mode = "preferred",    position = "auto",      scale = 1 })
-- unscale XWayland
hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})
-- Dual monitor example on G15 Strix
-- eDP-1 is the built in monitor while DP-1 is external
-- Both monitors here are at 1440 and 165Hz
-- DP-1 is on the left and  eDP-1 is on the right
-- hl.monitor({ output = "DP-1",  mode = "2560x1440@165", position = "0x0",    scale = 1 })
-- hl.monitor({ output = "eDP-1", mode = "2560x1440@165", position = "2560x0", scale = 1 })

-- `source = file.conf` becomes `require("file")`, which loads file.lua from this directory

require("onstart")
-- Source a file (multi-file configs)
require("binds")
-- require("myColors")
-- require("media-binds")
require("env_var")
-- require("rog-g15-strix-2021-binds")


hl.config({
    debug = {
        disable_logs = false,
    },
})

-- For all categories, see https://wiki.hypr.land/configuring/core/config-options/
hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,
        -- mouse_refocus = false,

        touchpad = {
            natural_scroll = true,
            scroll_factor  = 1.0,
            drag_lock      = true,
            tap_and_drag   = false,
        },

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
    },
})

hl.config({
    general = {
        gaps_in     = 3,
        gaps_out    = 3,
        border_size = 2,
        col = {
            -- active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            -- active_border = "rgb(cdd6f4)",
            -- active_border = "rgba(33ccffee)",
            -- active_border = { colors = { "rgb(FF0018)", "rgb(FFA52C)", "rgb(FFFF41)", "rgb(008018)", "rgb(0000F9)", "rgb(86007D)" }, angle = -45 },
            active_border   = { colors = { "rgb(ff5600)", "rgb(fc7e49)", "rgb(d946bb)", "rgb(b60083)", "rgb(ff5600)" }, angle = 45 },
            inactive_border = { colors = { "rgb(7201a1)", "rgb(ffffff)", "rgb(a4a1a1)", "rgb(000000)" }, angle = 45 },
        },

        -- layout = "master",
        layout = "dwindle",
    },
})

hl.config({
    misc = {
        disable_hyprland_logo = true,
    },
})

hl.config({
    decoration = {
        rounding       = 5,
        active_opacity = 0.95,

        blur = {
            enabled           = true,
            size              = 70,
            passes            = 5,
            -- noise          = 0.5,
            new_optimizations = true,
        },

        -- blurls = lockscreen  -> now a layer rule:
        -- hl.layer_rule({ match = { namespace = "lockscreen" }, blur = true })

        -- shadow = {
        --     enabled      = true,
        --     range        = 4,
        --     render_power = 3,
        --     color        = "rgba(1a1a1aee)",
        -- },
    },
})

hl.config({
    animations = {
        enabled = true,
    },
})

-- Some default animations, see https://wiki.hypr.land/configuring/core/animations/ for more
hl.curve("myBezier",        { type = "bezier", points = { {0.34, 0.9},  {0.3, 1.1}  } })
hl.curve("WorkspaceBezier", { type = "bezier", points = { {0.34, 1.26}, {0.64, 1.1} } })

-- hl.animation({ leaf = "windows",     enabled = true, speed = 6, bezier = "myBezier", style = "slide" })
-- hl.animation({ leaf = "windowsOut",  enabled = true, speed = 6, bezier = "myBezier", style = "slide" })
-- hl.animation({ leaf = "windowsIn",   enabled = true, speed = 6, bezier = "myBezier", style = "slide" })
-- hl.animation({ leaf = "windowsMove", enabled = true, speed = 6, bezier = "myBezier", style = "slide" })
hl.animation({ leaf = "border",     enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "fade",       enabled = true, speed = 7,  bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5,  bezier = "WorkspaceBezier", style = "slide" })

-- See https://wiki.hypr.land/configuring/layouts/dwindle-layout/ for more
hl.config({
    dwindle = {
        -- pseudotile = true, -- master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true, -- you probably want this
        -- smart_split = true,
    },
})

-- See https://wiki.hypr.land/configuring/layouts/master-layout/ for more
hl.config({
    master = {
        -- new_status = "master",
        allow_small_split = true,
        new_on_top        = true,
    },
})

hl.config({
    gestures = {
        -- workspace_swipe = true,
        -- workspace_swipe_fingers = 3,
        -- workspace_swipe_distance = 200,
        workspace_swipe_invert   = true,
        workspace_swipe_distance = 250,
    },
})
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

hl.config({
    group = {
        col = {
            border_inactive = { colors = { "rgb(f0ff00)", "rgb(ffffff)", "rgb(5b00a9)", "rgb(101010)" }, angle = 45 },
            border_active   = { colors = { "rgb(FF218C)", "rgb(FFD800)", "rgb(5b00a9)" }, angle = 45 },
            -- border_active = "rgb(FF8000)",
            -- border_inactive = "rgb(A0A0A0)",
        },

        groupbar = {
            height      = 14,
            font_size   = 7,
            font_family = "Comic Sans MS",
            text_color  = "rgb(4b3832)",
            gradients   = true,
            col = {
                -- active = { colors = { "rgb(bae1ff)", "rgb(baffc9)", "rgb(ffffba)", "rgb(ffdfba)", "rgb(ffb3ba)" }, angle = 0 },
                active   = "rgba(fff4e6bb)",
                inactive = "rgba(e6e6fa99)",
            },
        },
    },
})

-- Example per-device config
-- See https://wiki.hypr.land/configuring/core/devices/ for more
-- hl.device({
--     name        = "epic-mouse-v1",
--     sensitivity = -0.5,
-- })

-- Example windowrule v1
-- hl.window_rule({ match = { class = "^(rofi)$" },                 float = true })
-- hl.window_rule({ match = { class = "^(pavucontrol)$" },          float = true })
-- hl.window_rule({ match = { class = "^(blueman-manager)$" },      float = true })
-- hl.window_rule({ match = { class = "^(nm-connection-editor)$" }, float = true })
-- hl.window_rule({ match = { class = "^(chromium)$" },             float = true })
-- hl.window_rule({ match = { class = "^(thunar)$" },               float = true })
-- hl.window_rule({ match = { title = "^(btop)$" },                 float = true })
-- hl.window_rule({ match = { title = "^(update-sys)$" },           float = true })

-- Example windowrule v2
-- hl.window_rule({ match = { class = "^(kitty)$", title = "^(kitty)$" }, float = true })
-- See https://wiki.hypr.land/configuring/core/rules/window-rules/ for more
-- rules below would make the specific app transparent
-- hl.window_rule({ match = { class = "^(kitty)$" },                              opacity = "0.9 0.95" })
-- hl.window_rule({ match = { class = "^(kitty)$" },                              xray = true })
-- hl.window_rule({ match = { class = "^(kitty)$", title = "^(update-sys)$" },    animation = "popin" })
-- hl.window_rule({ match = { class = "^(firefox)$" },                            animation = "popin" })
-- hl.window_rule({ match = { class = "^(firefox)$" },                            opacity = "0.95 0.9" })
-- -- hl.window_rule({ match = { class = "^(telegram-desktop)$" },               opacity = "0.8 0.8" })
-- hl.window_rule({ match = { class = "^(telegram-desktop)$" },                   animation = "popin" })
-- hl.window_rule({ match = { class = "^(rofi)$" }, move = { "cursor_x - (window_w * 0.03)", "cursor_y - (window_h * 1.05)" } })
-- hl.window_rule({ match = { class = "^(rofi)$" },                               no_anim = true })
-- hl.window_rule({ match = { class = "^(rofi)$" },                               opacity = "0.8 0.6" })
-- hl.window_rule({ match = { class = "^(rofi)$" },                               stay_focused = true })


-- See https://wiki.hypr.land/configuring/ for more
