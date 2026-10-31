-- <leader>zz pads 'statuscolumn' so a 140-column area sits mid-window. Neovim
-- caps 'statuscolumn' at about 47 cells, so the padding stops at 40.
local width, max_pad = 140, 40
local on = false

local function apply()
	for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
		if vim.api.nvim_win_get_config(win).relative == "" then -- skip floats
			local pad = on and math.min(max_pad, math.floor((vim.api.nvim_win_get_width(win) - width) / 2)) or 0
			vim.wo[win].statuscolumn = pad > 0 and (" "):rep(pad) .. "%s%l " or ""
		end
	end
end

vim.keymap.set("n", "<leader>zz", function()
	on = not on
	apply()
end)
vim.api.nvim_create_autocmd({ "VimResized", "WinResized", "WinNew", "BufWinEnter", "TabEnter" }, { callback = apply })
