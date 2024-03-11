return {
  {
    "EdenEast/nightfox.nvim",
    name = "nightfox",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('nightfox').setup({
        options = {
          transparent = true, -- Disable setting background
        }
      })
      -- load the colorscheme here
      vim.cmd [[colorscheme carbonfox]]
      vim.cmd [[highlight NormalFloat guibg=NONE]]
    end
  }
}
