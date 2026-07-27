-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("cliphist-wipe")

	hl.exec_cmd("uwsm app -s b -- wl-paste --type text --watch cliphist store")
	hl.exec_cmd("uwsm app -s b -- wl-paste --type image --watch cliphist store")

	hl.exec_cmd("uwsm app -s s -- udiskie -s -a")
end)
