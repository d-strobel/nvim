return {
  "tpope/vim-fugitive",
  config = function()
    local api = vim.api

    api.nvim_set_keymap("n", "<leader>gs", ":Git<CR>", { noremap = true, silent = true })
    -- api.nvim_set_keymap("n", "<leader>gc", ":Git commit<CR>", { noremap = true, silent = true })
    -- api.nvim_set_keymap("n", "<leader>gp", ":Git push<CR>", { noremap = true, silent = true })
    -- api.nvim_set_keymap("n", "<leader>gd", ":Gdiff<CR>", { noremap = true, silent = true })
    -- api.nvim_set_keymap("n", "<leader>gl", ":Glog<CR>", { noremap = true, silent = true })
  end
}
