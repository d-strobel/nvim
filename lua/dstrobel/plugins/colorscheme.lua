return {
  {
    "folke/tokyonight.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      local tokyonight = require("tokyonight")

      tokyonight.setup({
        style = "night",

        on_highlights = function(hl, colors)
          hl.CurserLineNr = {
            fg = colors.blue,
            bold = true
          }
          hl.CurserLine = {
            bg = colors.blue
          }
        end
      })

      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}
