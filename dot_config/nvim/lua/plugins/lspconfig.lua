return {
	"neovim/nvim-lspconfig",
	config = function()
		-- clangd logs every request to stderr, which floods lsp.log
		vim.lsp.config("clangd", { cmd = { "clangd", "--log=error" } })
		-- lspconfig blocks on a cargo sysroot probe per Rust buffer unless this
		-- is set; "discover" is rust-analyzer's default
		vim.lsp.config("rust_analyzer", {
			settings = { ["rust-analyzer"] = { cargo = { sysroot = "discover" } } },
		})
		vim.lsp.enable({
			"clangd",
			"gopls",
			"pyright",
			"lua_ls",
			"ts_ls",
			"rust_analyzer",
			"bashls",
		})
	end,
}
