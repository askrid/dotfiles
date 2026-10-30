return {
	"miikanissi/modus-themes.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("modus-themes").setup({
			on_highlights = function(hl)
				hl.ColorColumn = { bg = "#121212" } -- faint line-length ruler
			end,
		})
		vim.cmd.colorscheme("modus_vivendi") -- dark theme
	end,
}
