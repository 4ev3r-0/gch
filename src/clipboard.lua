-- ai wrote this, im not going to even test it icl
local M = {}

function M.copy(text)
    local os_name = package.config:sub(1,1)

    if os_name == "\\" then
        local p = io.popen("clip", "w")
        p:write(text)
        p:close()
    else
        io.popen("pbcopy", "w"):write(text)
    end
end

return M
