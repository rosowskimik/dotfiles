-----------------------
---- LOOK AND FEEL ----
-----------------------
hl.config({
	general = {
		layout = "dwindle",

		gaps_in = 0,
		gaps_out = 0,
		border_size = 1,
		col = {
			active_border = {
				colors = {
					"rgba(33ccffee)",
					"rgba(fed99aee)",
				},
				angle = 45,
			},
			inactive_border = "rgba(595959cc)",
		},
	},

	decoration = {
		rounding = 0,
		blur = { enabled = false },
		shadow = { enabled = false },
	},

	group = {
		drag_into_group = 1,

		col = {
			border_active = {
				colors = { "rgba(33ccffee)", "rgba(fed99aee)" },
				angle = 45,
			},
			border_inactive = "rgba(595959cc)",
		},

		groupbar = {
			indicator_height = 2,
			render_titles = false,
			gaps_in = 0,
			gaps_out = 0,
			keep_upper_gap = false,

			col = {
				active = "rgb(83e0ff)",
				inactive = "rgba(595959cc)",
			},
		},
	},

	dwindle = {
		preserve_split = true,
	},
})

hl.curve("easeOutCubic", { type = "bezier", points = { { 0.23, 1 }, { 0.36, 1 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 1, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 1.5, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 1, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.2, bezier = "easeOutCubic" })

-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({
	name = "no-gaps-wtv1",
	match = { float = false, workspace = "w[tv1]" },
	border_size = 0,
	rounding = 0,
})
hl.window_rule({
	name = "no-gaps-f1",
	match = { float = false, workspace = "f[1]" },
	border_size = 0,
	rounding = 0,
})
