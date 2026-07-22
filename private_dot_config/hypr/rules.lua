--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- Float ----------------------------------------------------------------------
hl.window_rule({ float = true, match = { class = "^(galculator)$" } })
hl.window_rule({ float = true, match = { class = "^(firefox)$", title = "^(Firefox)$" } })
hl.window_rule({ float = true, match = { class = "^(blueman-sendto)$" } })
hl.window_rule({ float = true, match = { title = "^(Steam Settings)$" } })
hl.window_rule({ float = true, match = { class = "^(steam)$", title = "^(Friends List)$" } })
hl.window_rule({ float = true, match = { class = "^(kicad)$", title = "^(Assign Footprints)$" } })
hl.window_rule({ float = true, match = { class = "^(kicad)$", title = "^(Footprint:.*)$" } })
hl.window_rule({ float = true, match = { class = "^(kicad)$", title = "^(3D Viewer)$" } })
hl.window_rule({ float = true, match = { class = "^(file-png)$" } })
hl.window_rule({ float = true, match = { class = "^(Runsimics)$" } })
hl.window_rule({ float = true, match = { class = "^(imv)$" } })
hl.window_rule({ float = true, match = { class = "^(DivineDawn)$" } })
hl.window_rule({ float = true, match = { title = "^(Zenless Zone Zero)$" } })
hl.window_rule({ workspace = "9", match = { class = "^(steam_app_4162040)$" } })

-- Float + center + size ------------------------------------------------------
hl.window_rule({
	float = true,
	center = true,
	size = "(monitor_w*0.75) (monitor_h*0.75)",
	match = { class = "^(com.gabm.satty)$" },
})

-- Picture-in-Picture: float + pin --------------------------------------------
hl.window_rule({ float = true, pin = true, match = { title = "^(Picture-in-Picture)$" } })

-- No animation ---------------------------------------------------------------
hl.window_rule({ no_anim = true, match = { title = "^(wleave)$" } })

-- Grouping -------------------------------------------------------------------
hl.window_rule({ group = "set", match = { class = "^(virt-manager)$" } })
hl.window_rule({ group = "set", match = { class = "^(kicad)$" } })
hl.window_rule({ group = "barred", match = { class = "^(kitty)$" } })

-- Borderless floating popups -------------------------------------------------
hl.window_rule({ border_size = 0, match = { class = "^(org.gnome.FileRoller)$", title = "^$", float = true } })
-- hl.window_rule({ border_size = 0, match = { initialTitle = "^(Sign in to Steam)$", float = true } })
-- hl.window_rule({ border_size = 0, match = { initialTitle = "^(SteamWebhelper)$", float = true } })
