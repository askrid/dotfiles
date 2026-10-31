-- Marks the line limit from the project's formatter config, else the formatter's
-- default. JS/TS need a prettier config; other filetypes use 'textwidth'.
local clang = { width = 80, files = { ".clang-format" }, key = "ColumnLimit" }
local prettier = { width = 80, files = { ".prettierrc", ".prettierrc.json" }, key = "printWidth", needs_config = true }
local formatters = {
	c = clang,
	cpp = clang,
	java = { width = 100 },
	javascript = prettier,
	javascriptreact = prettier,
	lua = { width = 120, files = { "stylua.toml", ".stylua.toml" }, key = "column_width" },
	python = { width = 88, files = { "ruff.toml", ".ruff.toml", "pyproject.toml" }, key = "line%-length" },
	rust = { width = 100, files = { "rustfmt.toml", ".rustfmt.toml" }, key = "max_width" },
	typescript = prettier,
	typescriptreact = prettier,
}

vim.opt.colorcolumn = "+1"

vim.api.nvim_create_autocmd("FileType", {
	pattern = vim.tbl_keys(formatters),
	callback = function(ev)
		local f = formatters[ev.match]
		local config = f.files
			and vim.fs.find(f.files, { upward = true, path = vim.fs.dirname(ev.file), stop = vim.env.HOME })[1]
		if f.needs_config and not config then
			return
		end
		local n = config and table.concat(vim.fn.readfile(config), "\n"):match(f.key .. '"?[ \t]*[=:][ \t]*(%d+)')
		vim.opt_local.colorcolumn = tostring((tonumber(n) or f.width) + 1)
	end,
})
