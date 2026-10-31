return {
	"neovim/nvim-lspconfig",
	config = function()
		-- clangd logs every request to stderr, flooding lsp.log.
		vim.lsp.config("clangd", { cmd = { "clangd", "--log=error" } })
		-- Any sysroot ("discover" is the default) skips lspconfig's blocking cargo
		-- probe on every Rust buffer.
		vim.lsp.config("rust_analyzer", { settings = { ["rust-analyzer"] = { cargo = { sysroot = "discover" } } } })
		vim.lsp.enable({ "bashls", "clangd", "gopls", "lua_ls", "pyright", "rust_analyzer", "ts_ls" })
	end,
}
