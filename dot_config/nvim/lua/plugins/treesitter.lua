return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter').install({
            'c', 'cpp', 'go', 'rust', 'python',
            'vim', 'vimdoc', 'lua', 'query',
            'sql', 'html', 'javascript', 'typescript',
            'css', 'markdown',
        })

        vim.api.nvim_create_autocmd('FileType', {
            callback = function()
                pcall(vim.treesitter.start)
            end,
        })
    end,
}

