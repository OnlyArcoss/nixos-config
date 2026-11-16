-- env.lua

hl.env("HYPRCURSOR_THEME",                "Bibata-Modern-Ice")
hl.env("HYPRCURSOR_SIZE",                 "24")
hl.env("XCURSOR_THEME",                   "Bibata-Modern-Ice")
hl.env("XCURSOR_SIZE",                    "24")
hl.env("GTK_THEME",                       "Adwaita:dark")
hl.env("GTK_APPLICATION_PREFER_DARK_THEME", "1")
hl.env("GTK_USE_PORTAL",                  "1")

-- NVIDIA : VA-API via libva-nvidia-driver (requis avec libva >= 2.20)
-- Uniquement si le module nvidia est chargé (pas sur la VM sans GPU NVIDIA)
local nv = io.open("/sys/module/nvidia/version")
if nv then
    nv:close()
    hl.env("LIBVA_DRIVER_NAME",           "nvidia")
end