return {
  {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup({
        use_default_keymaps = false,
        keymaps = {
          ["<CR>"] = "actions.select",
          ["<C-l>"] = "actions.select",
          ["\""] = { "actions.select", opts = { horizontal = true } },
          ["%"] = { "actions.select", opts = { vertical = true } },
          ["<Esc>"] = { "actions.close", mode = "n" },
          ["<leader>e"] = { "actions.parent", mode = "n" },
        },
        view_options = {
          show_hidden = true,
        },
        float = {
          -- Padding around the floating window
          padding = 6,
          max_width = 0,
          max_height = 0,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
        },
      })

      -- Open parent directory in floating window
      vim.keymap.set("n", "<space>e", require("oil").toggle_float, { desc = "Open parent directory in floating window" })
    end,
  },
}
