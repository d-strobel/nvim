return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()

    local harpoon = require("harpoon")

    -- Required, see documentation
    harpoon:setup()

    -- set keymaps
    local keymap = vim.keymap

    keymap.set("n", "<leader>ha", function() harpoon:list():append() end, { desc = "Add file to harpoon" })
    keymap.set("n", "<tab>", function() harpoon:list():next() end, { desc = "Go to next harpoon file" })
    keymap.set("n", "<S-tab>", function() harpoon:list():prev() end, { desc = "Go to previous harpoon file" })
    keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Open harpoon quick menu" })

    keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end, { desc = "Go to harpoon file 1" })
    keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end, { desc = "Go to harpoon file 2" })
    keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end, { desc = "Go to harpoon file 3" })
    keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end, { desc = "Go to harpoon file 4" })
  end,

}
