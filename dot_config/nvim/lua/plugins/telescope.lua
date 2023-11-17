return {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    keys = {
        { '<leader>ff', '<cmd>Telescope find_files<cr>' },
        { '<leader>fg', '<cmd>Telescope git_files<cr>' },
        { '<leader>lg', '<cmd>Telescope live_grep<cr>' },
    },
}

