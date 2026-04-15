vim.opt.clipboard = 'unnamedplus'
vim.opt.autoread = true
vim.opt.guicursor = ''
vim.opt.showmode = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.completeopt = { 'noinsert', 'menuone', 'noselect' }
vim.opt.autoindent = true
vim.opt.ttyfast = true
vim.opt.wildmode = { 'longest', 'list' }
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.mouse = 'a'
vim.opt.mouse = 'v'
vim.opt.ignorecase = true
vim.opt.showmatch = true
vim.opt.shiftwidth = 4
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.isfname:append('@-@')
vim.diagnostic.config({ virtual_text = true })
vim.wo.signcolumn = "yes"

-- Set the working directory to the first command argument.
vim.opt.autochdir = false
vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
        local arg = vim.fn.argv(0)
        if arg ~= '' and vim.fn.isdirectory(arg) == 1 then
            vim.cmd.cd(arg)
        end
    end,
})

