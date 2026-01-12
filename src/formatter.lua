local M = {}

local function basename(path)
    return path:match("([^/]+)$") or path
end

local function uniq(list)
    local seen, out = {}, {}
    for _, v in ipairs(list) do
        if not seen[v] then
            seen[v] = true
            table.insert(out, v)
        end
    end
    return out
end

local function trim_to_limit(text, limit)
    if #text <= limit then return text end
    return text:sub(1, limit - 1) .. "…"
end

function M.render(changes)
    local files = {}
    local verbs = {}
    local description = {}

    for file, data in pairs(changes) do
        table.insert(files, basename(file))

        if #data.added.classes > 0 or #data.added.funcs > 0 then
            table.insert(verbs, "add")
        end
        if #data.removed.classes > 0 or #data.removed.funcs > 0 then
            table.insert(verbs, "remove")
        end
        if data.logic then
            table.insert(verbs, "update")
        end

        -- DESCRIPTION bullets
        table.insert(description, "- " .. file)

        if #data.added.classes > 0 then
            table.insert(description, "  - add classes: " .. table.concat(data.added.classes, ", "))
        end
        if #data.added.funcs > 0 then
            table.insert(description, "  - add functions: " .. table.concat(data.added.funcs, ", "))
        end
        if #data.removed.classes > 0 then
            table.insert(description, "  - remove classes: " .. table.concat(data.removed.classes, ", "))
        end
        if #data.removed.funcs > 0 then
            table.insert(description, "  - remove functions: " .. table.concat(data.removed.funcs, ", "))
        end
        if data.logic then
            table.insert(description, "  - update internal logic")
        end
    end

    files = uniq(files)
    verbs = uniq(verbs)

    local summary = table.concat(verbs, "/") ..
        " " .. table.concat(files, ", ")

    summary = trim_to_limit(summary, 72)

    return table.concat({
        "SUMMARY:",
        summary,
        "",
        "DESCRIPTION:",
        table.concat(description, "\n")
    }, "\n")
end

return M
