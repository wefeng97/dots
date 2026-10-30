-- Example binds, see https://wiki.hypr.land/configuring/core/binds/ for more

-- Definition of the main modifier key
local mainMod     = "SUPER"
local rlhypr      = "hyprctl reload"
local rlwaybar    = "killall waybar ; waybar &"
local rlhyprpaper = "killall hyprpaper ; hyprpaper &"
local rlhypridle  = "killall hypridle ; hypridle &"

-- `hyprctl dispatch focuswindow "^(Rofi)"` no longer works: hyprctl dispatch now takes Lua
local function focus_class(class)
    return "hyprctl dispatch 'hl.dsp.focus({ window = \"class:^(" .. class .. ")\" })'"
end

-- Reload Hyprland, Waybar, force-quit Hyprland
hl.bind(mainMod .. " + R",         hl.dsp.exec_cmd(rlhypr .. " && " .. rlwaybar .. " " .. rlhyprpaper .. " " .. rlhypridle)) -- reload everything
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("killall waybar && waybar &"))       -- reload Waybar
hl.bind(mainMod .. " + ALT + R",   hl.dsp.exec_cmd("killall hyprpaper && hyprpaper &")) -- reload hyprpaper
-- hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exit()) -- Exit Hyprland all together no (force quit Hyprland)

-- Lock, logout
-- hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("swaylock -i /home/wefeng/Pictures/My_Wallpapers/wp8575978.png --clock")) -- --fade-in 5
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("/usr/bin/swaylock"))
-- hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("swaylock"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("wlogout --protocol layer-shell")) -- show the logout window

-- Open terminal, file browser, app launcher, take a screenshot
hl.bind("CTRL + ALT + T",  hl.dsp.exec_cmd("kitty"))     -- open the terminal
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("librewolf")) -- open the browser
-- hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("$HOME/.config/rofi/launcher.sh drun & sleep 0.2 ; " .. focus_class("Rofi"))) -- Show the graphical app launcher
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("tofi-drun --drun-launch=true"))
-- hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("grim -g \"$(slurp)\" $HOME/Pictures/grim/$(date +'%Y%m%d_%H%M%S.png') | swappy -f -")) -- take a screenshot
hl.bind(mainMod .. " + S",         hl.dsp.exec_cmd("grim - | wl-copy"))                    -- take a screenshot and copy
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | wl-copy"))    -- take a screenshot and copy
hl.bind(mainMod .. " + CTRL + S",  hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | swappy -f -")) -- take a screenshot and edit
-- hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("$HOME/.config/rofi/launcher.sh \"emoji:rofimoji\" & sleep 0.2 ; " .. focus_class("Rofi"))) -- Show the emoji picker
hl.bind(mainMod .. " + E",         hl.dsp.exec_cmd("tofi-emoji"))
hl.bind(mainMod .. " + V",         hl.dsp.exec_cmd("clipmenu & sleep 0.2 ; " .. focus_class("Rofi")))                  -- Show the clipboard manager
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("rofi -modi calc -show calc & sleep 0.2 ; " .. focus_class("Rofi"))) -- Rofi calc
hl.bind(mainMod .. " + N",         hl.dsp.exec_cmd("networkmanager_dmenu & sleep 0.2 ; " .. focus_class("dmenu")))     -- Show the network manager

-- Move focus with mainMod + vim keys
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Current active window manipulation
-- hl.bind(mainMod .. " + P", hl.dsp.window.pseudo()) -- dwindle
hl.bind(mainMod .. " + Z", hl.dsp.window.fullscreen({ mode = "fullscreen" })) -- was `fullscreen, 2`
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))        -- toggle floating mode
hl.bind(mainMod .. " + C", hl.dsp.window.close())                             -- close the active window

-- Group manipulation
hl.bind(mainMod .. " + G",         hl.dsp.group.toggle())                                -- Toggle current window to a group
hl.bind("ALT + Tab",               hl.dsp.group.next())
hl.bind("ALT + SHIFT + Tab",       hl.dsp.group.prev())
hl.bind(mainMod .. " + I",         hl.dsp.group.lock({ all = true, action = "toggle" })) -- Toggle the lock of all groups
hl.bind(mainMod .. " + SHIFT + I", hl.dsp.group.lock({ action = "toggle" }))             -- Toggle the lock of the active group


-- Move windows with mainMod + SHIFT + vim keys

hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.move({ direction = "left",  group_aware = true }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.move({ direction = "right", group_aware = true }))
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.move({ direction = "up",    group_aware = true }))
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.move({ direction = "down",  group_aware = true }))

hl.bind(mainMod .. " + left",  hl.dsp.window.move({ direction = "left",  group_aware = true }))
hl.bind(mainMod .. " + right", hl.dsp.window.move({ direction = "right", group_aware = true }))
hl.bind(mainMod .. " + up",    hl.dsp.window.move({ direction = "up",    group_aware = true }))
hl.bind(mainMod .. " + down",  hl.dsp.window.move({ direction = "down",  group_aware = true }))

-- Resize windows with mainMod + CTRL + arrow keys (binde -> repeating)
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.resize({ x = 20,  y = 0,   relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + left",  hl.dsp.window.resize({ x = -20, y = 0,   relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + up",    hl.dsp.window.resize({ x = 0,   y = -20, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + down",  hl.dsp.window.resize({ x = 0,   y = 20,  relative = true }), { repeating = true })

-- Monitor manipulation
-- - Toggle workspaces to monitors
hl.bind(mainMod .. " + Tab",         hl.dsp.workspace.move({ monitor = "+1" }))
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.workspace.move({ monitor = "-1" }))
-- - Focus monitor with absolute number, mainMod + ALT + [1-5]
-- - Note that the laptop monitor has ID 0, but the number is 1 etc.
for i = 1, 5 do
    hl.bind(mainMod .. " + ALT + " .. i, hl.dsp.focus({ monitor = i - 1 }))
end

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + Page_Up",    hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + Page_Down",  hl.dsp.focus({ workspace = "e+1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Screen brightness
hl.bind("XF86MonBrightnessUp",           hl.dsp.exec_cmd("brightnessctl --min-value=1 s +3%"))
hl.bind("XF86MonBrightnessDown",         hl.dsp.exec_cmd("brightnessctl --min-value=1 s 3%-"))
hl.bind("SHIFT + XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl --min-value=1 s 10%+"))
hl.bind("SHIFT + XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl --min-value=1 s 10%-"))

-- Absolute screen brightness
hl.bind("CTRL + XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl s 50%"))
hl.bind("CTRL + XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 0%"))
hl.bind("ALT + XF86MonBrightnessUp",    hl.dsp.exec_cmd("brightnessctl s 30%"))
hl.bind("ALT + XF86MonBrightnessDown",  hl.dsp.exec_cmd("brightnessctl s 10%"))


-- Keyboard backlight
hl.bind(mainMod .. " + XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -d *::kbd_backlight set 50%+"))
hl.bind(mainMod .. " + XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -d *::kbd_backlight set 50%-"))

-- Volume and Media Control
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume -l 0 @DEFAULT_AUDIO_SINK@ 2%-"))
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("pamixer --default-source -m"))
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))

-- Wallpaper

hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("/home/wefeng/.config/hypr/ran_bg.sh"))
-- local w1 = "hyprctl hyprpaper wallpaper \"eDP-1, ~/Pictures/My_Wallpapers/342127-Haikyuu-Anime-Karasuno-Team-Volleyball.jpg\""
-- local w2 = "hyprctl hyprpaper wallpaper \"eDP-1, ~/Pictures/My_Wallpapers/Haikyuu_Tokyo.jpg\""
--
-- hl.bind(mainMod .. " + W",         hl.dsp.exec_cmd(w1))
-- hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd(w2))

-- Bindings for the previous versions
-- hl.bind(mainMod .. " + T",       hl.dsp.exec_cmd("~/.config/HyprV/hyprv_util vswitch")) -- switch HyprV version
-- hl.bind(mainMod .. " + ALT + V", hl.dsp.exec_cmd("cliphist list | wofi -dmenu | cliphist decode | wl-copy")) -- open clipboard manager
