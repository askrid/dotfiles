-- <leader>zz pads the left of each window so a 140-column area sits in the
-- middle. Neovim truncates 'statuscolumn' at about 47 cells and ignores it
-- past that, so the padding stops at 40.
local width, max_pad = 140, 40
local on = false

local function apply()
	for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
		if vim.api.nvim_win_get_config(win).relative == "" then
			local pad = on and math.min(max_pad, math.floor((vim.api.nvim_win_get_width(win) - width) / 2)) or 0
			vim.wo[win].statuscolumn = pad > 0 and string.rep(" ", pad) .. "%s%l " or ""
		end
	end
end

vim.keymap.set("n", "<leader>zz", function()
	on = not on
	apply()
end)

vim.api.nvim_create_autocmd({ "VimResized", "WinResized", "WinNew", "BufWinEnter", "TabEnter" }, {
	callback = apply,
})
