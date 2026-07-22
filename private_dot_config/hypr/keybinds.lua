---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

-- Exec ------------------------------------------------------------------------
hl.bind(mainMod .. " + return", hl.dsp.exec_cmd("kitty -1"))
hl.bind(mainMod .. " + SHIFT + return", hl.dsp.exec_cmd("kitty -1 -d /home/mroso yazi"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("firefox"))
hl.bind("CTRL + SHIFT + P", hl.dsp.exec_cmd("firefox --private-window"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("pkill fuzzel || fuzzel"))
hl.bind(
	mainMod .. " + V",
	hl.dsp.exec_cmd(
		[[cliphist list | fuzzel --dmenu --font="MonaspaceArgonVar:size=10" --no-sort --hide-prompt --width=80 --tabs=2 | cliphist decode | wl-copy]]
	)
)
hl.bind(
	mainMod .. " + SHIFT + C",
	hl.dsp.exec_cmd(
		[[_color=$(hyprpicker --format=hex --autocopy) && echo $_color | xargs -I_ notify-send -t 2500 "Copied _ to clipboard"]]
	)
)
hl.bind(
	"Print",
	hl.dsp.exec_cmd(
		[[hyprshot --mode output --freeze --raw | satty --filename - --output-filename "/home/mroso/Pictures/Screenshots/%Y-%m-%d_%H%M%S.png"]]
	)
)
hl.bind(
	mainMod .. " + Print",
	hl.dsp.exec_cmd(
		[[hyprshot --mode window --freeze --raw | satty --filename - --output-filename "/home/mroso/Pictures/Screenshots/%Y-%m-%d_%H%M%S.png"]]
	)
)
hl.bind(
	mainMod .. " + SHIFT + S",
	hl.dsp.exec_cmd(
		[[hyprshot --mode region --freeze --raw | satty --filename - --output-filename "/home/mroso/Pictures/Screenshots/%Y-%m-%d_%H%M%S.png"]]
	)
)
hl.bind(mainMod .. " + SHIFT + X", hl.dsp.exec_cmd("wleave --close-on-lost-focus --no-version-info"))

-- Media keys ------------------------------------------------------------------
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"), { locked = true })
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"),
	{ repeating = true, locked = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"),
	{ repeating = true, locked = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +5%"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { repeating = true, locked = true })

-- Basic -----------------------------------------------------------------------
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + Tab", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.window.pin({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized" })) -- was: fullscreen, 1
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen" })) -- was: fullscreen, 0
hl.bind(mainMod .. " + G", hl.dsp.group.toggle())
hl.bind(mainMod .. " + apostrophe", hl.dsp.window.toggle_swallow())
hl.bind(mainMod .. " + semicolon", hl.dsp.focus({ last = true })) -- was: focuscurrentorlast

-- Focus -----------------------------------------------------------------------
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))

-- Group active ----------------------------------------------------------------
hl.bind(mainMod .. " + CTRL + comma", hl.dsp.group.prev()) -- was: changegroupactive, b
hl.bind(mainMod .. " + CTRL + period", hl.dsp.group.next()) -- was: changegroupactive, f

-- Layout ----------------------------------------------------------------------
hl.bind(mainMod .. " + slash", hl.dsp.layout("togglesplit"))

hl.bind(mainMod .. " + CTRL + h", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + CTRL + j", hl.dsp.window.swap({ direction = "down" }))
hl.bind(mainMod .. " + CTRL + k", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + CTRL + l", hl.dsp.window.swap({ direction = "right" }))

hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.resize({ x = -10, y = 0 }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.resize({ x = 0, y = 10 }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.resize({ x = 0, y = -10 }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.resize({ x = 10, y = 0 }), { repeating = true })

-- Workspaces: switch (SUPER+N) and move-silent (SUPER+SHIFT+N) -----------------
for i = 1, 9 do
	local ws = tostring(i)
	hl.bind(mainMod .. " + " .. ws, hl.dsp.focus({ workspace = ws }))
	hl.bind(mainMod .. " + SHIFT + " .. ws, hl.dsp.window.move({ workspace = ws, follow = false })) -- silent
end

-- Move/resize with mouse ------------------------------------------------------
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
