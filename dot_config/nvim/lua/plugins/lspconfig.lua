return {
    'neovim/nvim-lspconfig',
    config = function()
        vim.lsp.enable({
            'clangd',
            'gopls',
            'pyright',
            'lua_ls',
            'ts_ls',
            'rust_analyzer',
        })
    end,
}

