return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local colors = {
      blue = "#0066ff",
      blue_bg = "#002966",
      red = "#ff0000",
      red_bg = "#660000",
      violet = "#cc33ff",
      violet_bg = "#4d0066",
      orange = "#ff9900",
      orange_bg = "#804d00",
      green = "#00e600",
      green_bg = "#004d00",
      inactive_bg = "#001433",
      fg = "#c3ccdc",
      bg = "#000000",
    }

    local lualine_theme = {
      normal = {
        a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
        b = { bg = colors.blue_bg, fg = colors.fg },
        c = { bg = colors.blue_bg, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.red, fg = colors.bg, gui = "bold" },
        b = { bg = colors.red_bg, fg = colors.fg },
        c = { bg = colors.red_bg, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
        b = { bg = colors.violet_bg, fg = colors.fg },
        c = { bg = colors.violet_bg, fg = colors.fg },
      },
      command = {
        a = { bg = colors.orange, fg = colors.bg, gui = "bold" },
        b = { bg = colors.orange_bg, fg = colors.fg },
        c = { bg = colors.orange_bg, fg = colors.fg },
      },
      replace = {
        a = { bg = colors.green, fg = colors.bg, gui = "bold" },
        b = { bg = colors.green_bg, fg = colors.fg },
        c = { bg = colors.green_bg, fg = colors.fg },
      },
      inactive = {
        a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
        b = { bg = colors.inactive_bg, fg = colors.semilightgray },
        c = { bg = colors.inactive_bg, fg = colors.semilightgray },
      },
    }

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = lualine_theme,
        disabled_filetypes = {
          "netrw", "fugitive"
        },
        section_separators = '',
        component_separators = ''
      },
      sections = {
        lualine_a = {
          "branch",
        },
        lualine_b = {
          "filename",
        },
        lualine_c = {},
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "filetype" },
        },
        lualine_y = {},
      },
    })
  end,
}
