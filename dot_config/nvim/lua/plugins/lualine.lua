-- Mirrors the p10k lean prompt (~/.p10k.zsh): path, git status, then the vi-mode
-- prompt char, in p10k's xterm-256 colors. Diagnostics keep the theme's colors.
local c = {
	dir = "#0087af", -- 31
	anchor = "#00afff", -- 39
	clean = "#5fd700", -- 76
	modified = "#d7af00", -- 178
	time = "#5f8787", -- 66
}
local modified = { fg = c.modified }
local prompt_char = { n = "❮", v = "V", V = "V", ["\22"] = "V", R = "▶" }

return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			theme = { normal = { c = { bg = "None" } } },
			globalstatus = true,
			component_separators = "",
			section_separators = "",
		},
		sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {
				-- Directory and filename are separate so each takes its own color.
				{
					function()
						local d = vim.fn.expand("%:~:.:h")
						return d == "." and "" or d .. "/"
					end,
					padding = 0,
					color = { fg = c.dir },
				},
				{ "filename", padding = { left = 0, right = 1 }, color = { fg = c.anchor, gui = "bold" } },
				{ "branch", icons_enabled = false, color = { fg = c.clean } },
				{
					"diff",
					-- Reuse gitsigns' hunk counts instead of running git diff.
					source = function()
						local s = vim.b.gitsigns_status_dict
						return s and { added = s.added, modified = s.changed, removed = s.removed }
					end,
					symbols = { added = "+", modified = "!", removed = "-" },
					diff_color = { added = modified, modified = modified, removed = modified },
				},
				{
					function()
						return prompt_char[vim.fn.mode():sub(1, 1)] or "❯"
					end,
					color = { fg = c.clean },
				},
			},
			lualine_x = {
				{ "diagnostics", symbols = { error = "✘", warn = "!", info = "i", hint = "h" } },
				{ "location", color = { fg = c.time } },
			},
			lualine_y = {},
			lualine_z = {},
		},
	},
}
