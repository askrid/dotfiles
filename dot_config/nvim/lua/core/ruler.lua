-- Marks the formatter's line limit: the project's config value when it sets
-- one, otherwise the formatter's default. JS/TS get one only with prettier.
-- Other filetypes fall back to 'textwidth' (gitcommit, editorconfig).
local prettier = { width = 80, files = { ".prettierrc", ".prettierrc.json" }, key = "printWidth", needs_config = true }
local formatters = {
	rust = { width = 100, files = { "rustfmt.toml", ".rustfmt.toml" }, key = "max_width" },
	python = { width = 88, files = { "ruff.toml", ".ruff.toml", "pyproject.toml" }, key = "line%-length" },
	lua = { width = 120, files = { "stylua.toml", ".stylua.toml" }, key = "column_width" },
	c = { width = 80, files = { ".clang-format" }, key = "ColumnLimit" },
	cpp = { width = 80, files = { ".clang-format" }, key = "ColumnLimit" },
	java = { width = 100 },
	javascript = prettier,
	javascriptreact = prettier,
	typescript = prettier,
	typescriptreact = prettier,
}

vim.opt.colorcolumn = "+1"

vim.api.nvim_create_autocmd("FileType", {
	callback = function(ev)
		local f = formatters[ev.match]
		if not f then
			return
		end
		local config = f.files
			and vim.fs.find(f.files, { upward = true, path = vim.fs.dirname(ev.file), stop = vim.env.HOME })[1]
		if f.needs_config and not config then
			return
		end
		local width = f.width
		if config then
			for line in io.lines(config) do
				local n = line:match(f.key .. '"?%s*[=:]%s*(%d+)')
				if n then
					width = tonumber(n)
					break
				end
			end
		end
		vim.opt_local.colorcolumn = tostring(width + 1)
	end,
})
