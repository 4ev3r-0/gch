local git = require("src.git")
local analyzer = require("src.analyzer")
local formatter = require("src.formatter")
local clipboard = require("src.clipboard")
local config = require("src.config")

git.ensure_repo()

local diff = git.get_diff(config.staged_only)
local changes = analyzer.analyze(diff)
local output = formatter.render(changes)
print(output)

if config.auto_clipboard then
	clipboard.copy(output)
end
