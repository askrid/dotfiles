return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
	cmd = "Telescope",
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>" },
		{ "<leader>fg", "<cmd>Telescope git_files<cr>" },
		{ "<leader>fa", "<cmd>Telescope live_grep<cr>" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>" },
		{ "<leader>fs", "<cmd>Telescope git_status<cr>" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>" },
	},
	opts = { defaults = { sorting_strategy = "ascending", layout_config = { prompt_position = "top" } } },
}
