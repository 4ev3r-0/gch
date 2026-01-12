local diff_parser = require("src.diff")
local patterns = require("src.patterns")
local analyzer = {}

local function match_any(line,list)
	for _, p in ipairs(list) do
		local m = line:match(p)
		if m then return m end
	end
end

function analyzer.analyze(diff)
	local parsed = diff_parser.parse(diff)
	local result = {}

	for file, lines in pairs(parsed) do
		local entry = {
			added = { classes = {}, funcs = {} },
			removed = { classes = {}, funcs = {} },
			logic = false
		}

		for _, l in ipairs(lines) do
			local kind = l:sub(1,1)
			local content = l:sub(2)
			local class = match_any(content, patterns.class)
			local func = match_any(content, patterns.func)

			if kind == "+" then
				if class then table.insert(entry.added.classes, class)
				elseif func then table.insert(entry.added.funcs, func)
				else entry.logic = true end
			elseif kind == "-" then
				if class then table.insert(entry.removed.classes, class)
				elseif func then table.insert(entry.removed.funcs, func)
				else entry.logic = true end
			end
		end
	result[file] = entry
	end
	return result
end

return analyzer
