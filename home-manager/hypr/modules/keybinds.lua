-- keybinds.lua

local mainMod = "SUPER"

-- Actions principales
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + ESCAPE", hl.dsp.exec_cmd(os.getenv("HOME") .. "/.local/bin/system-menu"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(os.getenv("HOME") .. "/.local/bin/toggle-waybar.sh"))

-- Screenshot région
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region -c"))

-- Déplacement du focus
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }))

-- Workspaces layout FR
local wsKeys = {
    { key = "ampersand",  ws = 1 },
    { key = "eacute",     ws = 2 },
    { key = "quotedbl",   ws = 3 },
    { key = "apostrophe", ws = 4 },
    { key = "parenleft",  ws = 5 },
    { key = "minus",      ws = 6 },
    { key = "egrave",     ws = 7 },
    { key = "underscore", ws = 8 },
    { key = "ccedilla",   ws = 9 },
    { key = "agrave",     ws = 10 },
}

for _, entry in ipairs(wsKeys) do
    hl.bind(mainMod .. " + " .. entry.key,
        hl.dsp.focus({ workspace = entry.ws }))
    hl.bind("SUPER + SHIFT + " .. entry.key,
        hl.dsp.window.move({ workspace = entry.ws }))
end

-- Souris : déplacer / redimensionner fenêtres
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Volume (swayosd)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("swayosd-client --output-volume raise"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("swayosd-client --output-volume lower"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"),
    { locked = true, repeating = true })

-- Luminosité
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Média (playerctl)
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
