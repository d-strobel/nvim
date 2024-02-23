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

    keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = "Add file to harpoon" })
    keymap.set("n", "<TAB-k>", function() harpoon:list():next() end, { desc = "Go to next harpoon file" })
    keymap.set("n", "<TAB-j>", function() harpoon:list():prev() end, { desc = "Go to previous harpoon file" })
    keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Open harpoon quick menu" })
  end,
}
