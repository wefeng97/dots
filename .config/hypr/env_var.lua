-- Environment Variables
-- see https://wiki.hypr.land/configuring/core/environment-variables/

-- Theming Related Variables
-- Set cursor size. See FAQ below for why you might want this variable set.
-- https://wiki.hypr.land/faq/
hl.env("XCURSOR_SIZE", "16")

-- Set a GTK theme manually, for those who want to avoid appearance tools such as lxappearance or nwg-look
-- hl.env("GTK_THEME", "")

-- Set your cursor theme. The theme needs to be installed and readable by your user.
-- hl.env("XCURSOR_THEME", "")

-- the line below may help with multiple monitors
hl.env("WLR_EGL_NO_MODIFIERS", "1")

-- XDG Specifications
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_CONFIG_HOME", os.getenv("HOME") .. "/.config")

-- GTK Specifications
hl.env("GTK_THEME", "Orchis-Green-Dark")

-- QT Specifications
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("CM_LAUNCHER", "tofi")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_STYLE_OVERRIDE", "kvantum")

-- Toolkit Backend Variables

-- GTK: Use wayland if available, fall back to x11 if not.
hl.env("GDK_BACKEND", "wayland,x11")

-- QT: Use wayland if available, fall back to x11 if not.
-- hl.env("QT_QPA_PLATFORM", "wayland,xcb")

-- Run SDL2 applications on Wayland. Remove or set to x11 if games that
-- provide older versions of SDL cause compatibility issues
hl.env("SDL_VIDEODRIVER", "x11")

-- Clutter package already has wayland enabled, this variable
-- will force Clutter applications to try and use the Wayland backend
-- hl.env("CLUTTER_BACKEND", "wayland")

-- QT Variables

-- (From the QT documentation) enables automatic scaling, based on the monitor’s pixel density
-- https://doc.qt.io/qt-5/highdpi.html
-- hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")

-- Tell QT applications to use the Wayland backend, and fall back to x11 if Wayland is unavailable
-- hl.env("QT_QPA_PLATFORM", "wayland,xcb")

-- Disables window decorations on QT applications
-- hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

-- Tells QT based applications to pick your theme from qt5ct, use with Kvantum.
-- hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
