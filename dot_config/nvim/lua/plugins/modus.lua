return {
	"miikanissi/modus-themes.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("modus-themes").setup({
			transparent = true, -- kitty's background, so the edges match
			-- No gutter backgrounds, like p10k lean; also hides the centering padding.
			line_nr_column_background = false,
			sign_column_background = false,
			on_highlights = function(hl, c)
				hl.CursorLineNr = { fg = c.fg_active, bold = true }
				hl.ColorColumn = { bg = "#121212" } -- faint ruler
				hl.Whitespace = { fg = c.bg_dim } -- indent guides
				hl.PmenuSel = { bg = c.bg_active, bold = true }
				hl.PmenuThumb = { bg = c.border }
				-- Popup borders match the split lines; blink's default to text color.
				hl.FloatBorder = { fg = c.border }
				for _, g in ipairs({ "BlinkCmpMenuBorder", "BlinkCmpDocBorder", "BlinkCmpSignatureHelpBorder" }) do
					hl[g] = { link = "FloatBorder" }
				end
			end,
		})
		vim.cmd.colorscheme("modus_vivendi")
	end,
}
