return {
  "tpope/vim-fugitive",
  config = function()
    local api = vim.api

    api.nvim_set_keymap("n", "<leader>gs", "<CMD>Git<CR>", { noremap = true, silent = true })
    api.nvim_set_keymap("n", "<leader>gc", "<CMD>Git commit<CR>", { noremap = true, silent = true })
    api.nvim_set_keymap("n", "<leader>gp", "<CMD>Git push<CR>", { noremap = true, silent = true })
    api.nvim_set_keymap("n", "<leader>gd", "<CMD>Git diff<CR>", { noremap = true, silent = true })
    api.nvim_set_keymap("n", "<leader>gl", "<CMD>Git log<CR>", { noremap = true, silent = true })
  end
}
