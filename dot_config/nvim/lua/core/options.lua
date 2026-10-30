vim.opt.clipboard = "unnamedplus"
vim.opt.guicursor = ""
vim.opt.showmode = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.completeopt = { "noinsert", "menuone", "noselect" }
vim.opt.wildmode = { "longest", "list" }
vim.opt.mouse = "v"
vim.opt.ignorecase = true
vim.opt.showmatch = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")
vim.diagnostic.config({ virtual_text = true })

-- No remote plugins use these providers.
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

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

-- Set the working directory to the first command argument.
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local arg = vim.fn.argv(0)
		if arg ~= "" and vim.fn.isdirectory(arg) == 1 then
			vim.cmd.cd(arg)
		end
	end,
})
