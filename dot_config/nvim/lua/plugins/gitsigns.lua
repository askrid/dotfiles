return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      add          = { text = "│" },
      change       = { text = "│" },
      delete       = { text = "_" },
      topdelete    = { text = "‾" },
      changedelete = { text = "~" },
      untracked    = { text = "┆" },
    },
    on_attach = function(bufnr)
      local gs = require("gitsigns")
      local function map(lhs, rhs)
        vim.keymap.set("n", lhs, rhs, { buffer = bufnr })
      end
      map("<leader>dp", gs.preview_hunk)
      map("<leader>dP", gs.preview_hunk_inline)
      map("]d", function() gs.nav_hunk("next") end)
      map("[d", function() gs.nav_hunk("prev") end)
    end,
    signcolumn = true,
  },
}
