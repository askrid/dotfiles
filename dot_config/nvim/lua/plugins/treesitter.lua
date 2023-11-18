return {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufReadPre',
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = {
                'c',
                'cpp',
                'go',
                'rust',
                'python',
                'vim',
                'vimdoc',
                'lua',
                'query',
                'sql',
                'html',
                'javascript',
                'typescript',
                'css',
                'markdown',
            },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
            },
        })
    end,
}

