require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "c",
        "cpp",
        "go",
        "rust",
        "vim",
        "vimdoc",
        "lua",
        "query",
        "javascript",
        "typescript",
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
   },
}

