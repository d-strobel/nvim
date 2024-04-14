return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      -- Get the colors from the palette
      local mocha = require("catppuccin.palettes").get_palette "mocha"

      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = false, -- disables setting the background color.
        show_end_of_buffer = true,      -- shows the '~' characters after the end of buffers
        term_colors = false,            -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = false,              -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15,            -- percentage of the shade to apply to the inactive window
        },
        no_italic = true,
        no_bold = true,
        no_underline = true,
        color_overrides = {
          mocha = {
            base = mocha.crust,
          }
        },
        custom_highlights = {},
        default_integrations = true,
        integrations = {
          cmp = true,
          gitsigns = false,
          nvimtree = false,
          treesitter = true,
          notify = false,
        },
      })

      -- load the colorscheme here
      vim.cmd [[colorscheme catppuccin-mocha]]
      vim.cmd [[highlight NormalFloat guibg=NONE]]
    end
  }
}
