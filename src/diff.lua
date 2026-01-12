local d = {}

function d.parse(diff)
	local files = {}
	local current

	for line in diff:gmatch("[^\r\n]+") do
		local file = line:match("^%+%+%+ b/(.+)")
		if file then
			current = file
			files[current] = files[current] or {}
		end

		if current and (line:match("^%+") or line:match("^%-")) then
			table.insert(files[current], line)
		end
	end
	return files
end

return d
