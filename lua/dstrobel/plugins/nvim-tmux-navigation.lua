return {
  "nathom/tmux.nvim",
  config = function()
    local map = vim.api.nvim_set_keymap
    map("n", "<C-h>", [[<cmd>lua require('tmux').move_left()<cr>]], {})
    map("n", "<C-j>", [[<cmd>lua require('tmux').move_down()<cr>]], {})
    map("n", "<C-k>", [[<cmd>lua require('tmux').move_up()<cr>]], {})
    map("n", "<C-l>", [[<cmd>lua require('tmux').move_right()<cr>]], {})
  end,
}
