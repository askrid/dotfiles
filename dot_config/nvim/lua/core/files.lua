-- Files over 1 MB open as plain text: no treesitter, LSP or ftplugins.
vim.filetype.add({
	pattern = {
		[".*"] = {
			function(path)
				return vim.fn.getfsize(path) > 1024 * 1024 and "bigfile" or nil
			end,
			{ priority = math.huge },
		},
	},
})

-- `nvim <dir>` makes <dir> the working directory.
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local arg = vim.fn.argv(0)
		if vim.fn.isdirectory(arg) == 1 then
			vim.cmd.cd(arg)
		end
	end,
})
