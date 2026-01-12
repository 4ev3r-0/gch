local M = {}
local function folder(path)
	return path:match("(.+)/") or "."
end


function M.render(changes)
    local out = {}
    table.insert(out, "=== CHANGE SUMMARY ===\n")

    local folders = {}

    for file, data in pairs(changes) do
        local f = folder(file)
        folders[f] = folders[f] or {}
        table.insert(folders[f], { file = file, data = data })
    end

    for f, files in pairs(folders) do
        table.insert(out, f .. "/")
        for _, item in ipairs(files) do
            local d = item.data
            table.insert(out, "  " .. item.file)

            if #d.added.classes > 0 then
                table.insert(out, "    + classes: " .. table.concat(d.added.classes, ", "))
            end
            if #d.added.funcs > 0 then
                table.insert(out, "    + functions: " .. table.concat(d.added.funcs, ", "))
            end
            if #d.removed.classes > 0 then
                table.insert(out, "    - classes: " .. table.concat(d.removed.classes, ", "))
            end
            if #d.removed.funcs > 0 then
                table.insert(out, "    - functions: " .. table.concat(d.removed.funcs, ", "))
            end
            if d.logic then
                table.insert(out, "    ~ internal logic changes")
            end
        end
        table.insert(out, "")
    end

    table.insert(out, "=== COMMIT MESSAGE TEMPLATE ===\n")
    table.insert(out, "feat: \n")
    table.insert(out, "Details:")
    table.insert(out, table.concat(out, "\n"))

    return table.concat(out, "\n")
end

return M
