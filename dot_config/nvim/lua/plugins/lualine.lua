-- Mirrors the p10k lean prompt in ~/.p10k.zsh: no background or separators,
-- dir and git status on the left, the vi-mode prompt char after them.
-- Colors are the same xterm-256 indices p10k uses.
local c = {
	dir = "#0087af", -- 31
	anchor = "#00afff", -- 39
	clean = "#5fd700", -- 76
	modified = "#d7af00", -- 178
	error = "#d70000", -- 160
	time = "#5f8787", -- 66
	grey = "#808080", -- 244
}

local plain = { bg = "None" }
local dim = { fg = c.grey, bg = "None" }
local theme = {
	normal = { a = plain, b = plain, c = plain },
	inactive = { a = dim, b = dim, c = dim },
}

local prompt_char = { n = "❮", v = "V", V = "V", ["\22"] = "V", R = "▶" }

local dir = {
	function()
		local d = vim.fn.expand("%:~:.:h")
		return d == "." and "" or d .. "/"
	end,
	padding = 0,
}
local file = { "filename", padding = { left = 0, right = 1 } }

return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			theme = theme,
			component_separators = "",
			section_separators = "",
		},
		sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {
				vim.tbl_extend("force", dir, { color = { fg = c.dir } }),
				vim.tbl_extend("force", file, { color = { fg = c.anchor, gui = "bold" } }),
				{ "branch", icons_enabled = false, color = { fg = c.clean } },
				{
					"diff",
					-- gitsigns already tracks hunks; lualine would run git diff itself
					source = function()
						local s = vim.b.gitsigns_status_dict
						return s and { added = s.added, modified = s.changed, removed = s.removed }
					end,
					symbols = { added = "+", modified = "!", removed = "-" },
					diff_color = {
						added = { fg = c.modified },
						modified = { fg = c.modified },
						removed = { fg = c.modified },
					},
				},
				{
					function()
						return prompt_char[vim.fn.mode():sub(1, 1)] or "❯"
					end,
					color = { fg = c.clean },
				},
			},
			lualine_x = {
				{
					"diagnostics",
					symbols = { error = "✘", warn = "!", info = "i", hint = "h" },
					diagnostics_color = {
						error = { fg = c.error },
						warn = { fg = c.modified },
						info = { fg = c.anchor },
						hint = { fg = c.grey },
					},
				},
				{ "location", color = { fg = c.time } },
			},
			lualine_y = {},
			lualine_z = {},
		},
		inactive_sections = {
			lualine_c = { dir, file },
			lualine_x = { "location" },
		},
	},
}
