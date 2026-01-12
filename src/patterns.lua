-- this is just for general detections, no clue if it will actually work but worth trying :3
return {

	class = {
		"^class%s+([%w_]+)",
		"^export%s+class%s+([%w_]+)",
		"^struct%s+([%w_]+)"
	},

	func = {
		"^function%s+([%w_%.:]+)",
		"^def%s+([%w_]+)",
		"^fn%s+([%w_]+)",
		"^func%s+([%w_]+)",
		"^export%s+function%s+([%w_]+)",
		"^[%w_%*]+%s+([%w_]+)%s*%b()%s*{"
	}
}
