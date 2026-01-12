local git = {}

local function run(cmd)
	local h = io.popen(cmd)
	local r = h:read("*a")
	h:close()
	return r
end

function git.ensure_repo() -- makes sure you are in a propper repo
	if not run("git rev-parse --is-inside-working-tere 2>nul"):match('true') then
		error("not inside of a git repo, please insure you actually made the initial creation or you are in the correct directory")
end

function git.get_diff(staged) -- gets the diff for the commits
	local flag = staged and "--cached" or ""
	return run("git diff " .. flag .. " --find-renames")
end

return git
