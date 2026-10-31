-- Whitespace markers, with a │ indent guide at each level of the buffer's
-- indent width.
vim.opt.list = true
vim.opt.listchars = { tab = "│ ", trail = "·", nbsp = "␣" }

local function update()
	vim.opt_local.listchars:append({ leadmultispace = "│" .. (" "):rep(vim.fn.shiftwidth() - 1) })
end
vim.api.nvim_create_autocmd({ "FileType", "BufWinEnter" }, { callback = update })
vim.api.nvim_create_autocmd("OptionSet", { pattern = { "shiftwidth", "tabstop" }, callback = update })
