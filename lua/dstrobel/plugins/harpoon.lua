return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local harpoon = require('harpoon')

    -- Required
    harpoon:setup({})

    -- set keymaps
    local keymap = vim.keymap
    keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    keymap.set("n", "<A-a>", function() harpoon:list():add() end, { desc = "Add file to harpoon" })
    keymap.set("n", "<A-k>", function() harpoon:list():next() end, { desc = "Go to next harpoon file" })
    keymap.set("n", "<A-j>", function() harpoon:list():prev() end, { desc = "Go to previous harpoon file" })

    keymap.set("n", "<A-1>", function() harpoon:list():select(1) end, { desc = "Go to harpoon file 1" })
    keymap.set("n", "<A-2>", function() harpoon:list():select(2) end, { desc = "Go to harpoon file 2" })
    keymap.set("n", "<A-3>", function() harpoon:list():select(3) end, { desc = "Go to harpoon file 3" })
    keymap.set("n", "<A-4>", function() harpoon:list():select(4) end, { desc = "Go to harpoon file 4" })
    keymap.set("n", "<A-5>", function() harpoon:list():select(5) end, { desc = "Go to harpoon file 5" })

    harpoon:extend({
      UI_CREATE = function(cx)
        vim.keymap.set("n", "<C-l>", function()
          harpoon.ui:select_menu_item()
        end, { buffer = cx.bufnr })

        vim.keymap.set("n", "%", function()
          harpoon.ui:select_menu_item({ vsplit = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set("n", "\"", function()
          harpoon.ui:select_menu_item({ split = true })
        end, { buffer = cx.bufnr })
      end,
    })
  end,
}
