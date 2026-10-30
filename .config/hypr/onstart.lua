-- Translated from onstart.conf
-- `exec-once` -> inside the "hyprland.start" event (runs once at login)
-- `exec`      -> on start AND on every config reload
-- `[rules] cmd` -> hl.exec_cmd(cmd, { rules })

-- exec (runs on every reload, like before)
local function on_every_load()
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP QT_QPA_PLATFORMTHEME")
end
hl.on("config.reloaded", on_every_load)

-- Execute your favorite apps at launch
hl.on("hyprland.start", function()
    -- hl.exec_cmd("~/.config/hypr/xdg-portal-hyprland")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    on_every_load()
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    hl.exec_cmd("systemctl --user start graphical-session.target")
    -- hl.exec_cmd("fcitx5-remote -r")
    -- Input method
    hl.exec_cmd("fcitx5 -d --replace")

    -- The necessity of the DE
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper &> ~/.cache/hyprpaper.log")
    hl.exec_cmd("hypridle")

    -- Wifi indicator
    hl.exec_cmd("nm-applet --indicator")

    -- The fav apps

    hl.exec_cmd("librewolf", { workspace = "4 silent" })

    -- hl.window_rule({ match = { class = "^(thunderbird)$", title = "^(Mozilla Thunderbird)$" }, opacity = "0.80 0.80" })
    -- hl.window_rule({ match = { class = "^(thunderbird)$", title = "^(Mozilla Thunderbird)$" }, workspace = "5 silent" })
    -- hl.window_rule({ match = { title = "^(Proton Mail)$" },          group = "new" })
    -- hl.window_rule({ match = { title = "^(.*)(Thunderbird)(.*)$" },  group = "set" })
    hl.exec_cmd("thunderbird", { workspace = "3 silent" })
    hl.exec_cmd("proton-mail", { workspace = "3 silent" })

    -- hl.window_rule({ match = { class = "^(slack)$", title = "^(slack)$" }, workspace = "6 silent" })
    -- hl.exec_cmd("slack", { workspace = "2 silent" })
    hl.exec_cmd("mattermost-desktop", { workspace = "2 silent" })

    -- hl.window_rule({ match = { class = "^(telegram-desktop)$", title = "^(Telegram)$" }, workspace = "6 silent" })
    hl.exec_cmd("Telegram", { workspace = "1 silent" })
    hl.exec_cmd("whatsdesk", { workspace = "1 silent" })

    -- Don't know what it does. Need some research
    hl.exec_cmd("mako")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("wl-paste --watch cliphist store")
end)
