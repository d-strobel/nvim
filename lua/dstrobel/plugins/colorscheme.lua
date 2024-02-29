return {
  {
    "folke/tokyonight.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      local tokyonight = require("tokyonight")

      tokyonight.setup({
        style = "night",
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent"
        }
      })

      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}
