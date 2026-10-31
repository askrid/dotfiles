local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.guicursor = ""
opt.showmode = false
opt.showmatch = true
opt.wrap = false
opt.scrolloff = 8
opt.winborder = "rounded"
opt.fillchars = { eob = " " }

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.clipboard = "unnamedplus"
opt.mouse = "v"
opt.ignorecase = true
opt.completeopt = { "noinsert", "menuone", "noselect" }
opt.wildmode = { "longest", "list" }
opt.isfname:append("@-@")
opt.swapfile = false
opt.backup = false

-- Tint the line number instead of drawing a sign, which would hide the gitsigns
-- bar; show the message only on the cursor line.
local signs = {
	text = { "", "", "", "" }, -- by severity, error to hint
	numhl = { "DiagnosticSignError", "DiagnosticSignWarn", "DiagnosticSignInfo", "DiagnosticSignHint" },
}
vim.diagnostic.config({ severity_sort = true, virtual_text = { current_line = true }, signs = signs })

-- No remote plugins use these providers.
for _, p in ipairs({ "node", "perl", "python3", "ruby" }) do
	vim.g["loaded_" .. p .. "_provider"] = 0
end
