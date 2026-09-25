-- Migrated for Hyprland 0.56.2. Original hyprland.conf retained for rollback.
local colors = dofile(os.getenv("HOME") .. "/.config/hypr/colors.lua")

hl.monitor({ output = "", mode = "highres", position = "auto", scale = "auto" })
hl.on("hyprland.start", function() hl.exec_cmd("uwsm app -- waybar") end)
hl.on("hyprland.start", function() hl.exec_cmd("uwsm app -- gslapper -r 60 -o \"loop no-audio\" --cache-size 0 \"*\" $HOME/.local/share/imgs/wall-miku.mp4") end)
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("HYPRCURSOR_SIZE", "30")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.config({
    ecosystem = {
        no_update_news = true,
        no_donation_nag = true,
    },
})

hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 8,
        border_size = 1,
        col = {
            active_border = { colors = { colors.base0C, colors.base0E }, angle = 45 },
            inactive_border = colors.base02,
        },
        resize_on_border = false,
        allow_tearing = true,
        layout = "dwindle",
    },
})

hl.config({
    decoration = {
        rounding = 8,
        rounding_power = 10,
        active_opacity = 1.0,
        inactive_opacity = 0.9,
        shadow = {
            enabled = true,
            range = 3,
            render_power = 8,
            color = colors.base00,
        },
        blur = {
            enabled = true,
            size = 5,
            passes = 1,
            vibrancy = 0.1696,
        },
    },
})

hl.config({
    animations = {
        enabled = true,
    },
})
hl.curve("easeOutQuint", { type = "bezier", points = { {0.23, 1}, {0.32, 1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear", { type = "bezier", points = { {0, 0}, {1, 1} } })
hl.curve("almostLinear", { type = "bezier", points = { {0.5, 0.5}, {0.75, 1} } })
hl.curve("quick", { type = "bezier", points = { {0.15, 0}, {0.1, 1} } })
hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

hl.config({
    dwindle = {
        preserve_split = true,
    },
})

hl.config({
    master = {
        new_status = "master",
    },
})

hl.config({
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
    },
})

hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = -0.5,
        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + W", hl.dsp.window.close())
hl.bind("SUPER + Q", hl.dsp.window.kill())
hl.bind("SUPER + E", hl.dsp.exec_cmd("nemo"))
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("rofi -show drun -run-command \"uwsm app -- {cmd}\""))
hl.bind("SUPER + S", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + T", hl.dsp.window.pseudo())
hl.bind("SUPER + F", hl.dsp.window.fullscreen())
hl.bind("SUPER + V", hl.dsp.layout("togglesplit"))
hl.bind("SUPER + SHIFT + Q", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind("SUPER + ALT + H", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + ALT + L", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + ALT + J", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })
hl.bind("SUPER + ALT + K", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
hl.bind("SUPER + 1", hl.dsp.focus({ workspace = "1" }))
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = "2" }))
hl.bind("SUPER + 3", hl.dsp.focus({ workspace = "3" }))
hl.bind("SUPER + 4", hl.dsp.focus({ workspace = "4" }))
hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({ workspace = "1", follow = true }))
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({ workspace = "2", follow = true }))
hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({ workspace = "3", follow = true }))
hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({ workspace = "4", follow = true }))
hl.bind("SUPER + M", hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + M", hl.dsp.window.move({ workspace = "special:magic", follow = true }))
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind("SUPER + CTRL + SPACE", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("SUPER + CTRL + H", hl.dsp.exec_cmd("playerctl position 5-"))
hl.bind("SUPER + CTRL + L", hl.dsp.exec_cmd("playerctl position 5+"))
hl.bind("SUPER + CTRL + J", hl.dsp.exec_cmd("playerctl next"))
hl.bind("SUPER + CTRL + K", hl.dsp.exec_cmd("playerctl previous"))
hl.workspace_rule({ workspace = "1", persistent = true })
hl.workspace_rule({ workspace = "2", persistent = true })
hl.workspace_rule({ workspace = "3", persistent = true })
hl.workspace_rule({ workspace = "4", persistent = true })
hl.window_rule({
    name = "suppress-maximize-events",
    suppress_event = "maximize",
    match = { class = ".*" },
})
hl.window_rule({
    name = "fix-xwayland-drags",
    no_focus = true,
    match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
})
hl.window_rule({
    name = "move-hyprland-run",
    move = "20 monitor_h-120",
    float = true,
    match = { class = "hyprland-run" },
})
