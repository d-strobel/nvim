return {
  "tpope/vim-fugitive",
  config = function()

    -- Git status
    vim.keymap.set("n", "<leader>gs", "<CMD>Git<CR>", { noremap = true, silent = true })

    -- Commit with message
    vim.keymap.set("n", "<leader>gc", function()
      local msg = vim.fn.input("Commit message: ")
      -- Concat message string
      if msg ~= "" then
        msg = "Git commit -m '" .. msg
        vim.cmd(msg .. "'")
      else
        vim.cmd("Git commit")
      end
    end, { noremap = true, silent = true })

    vim.keymap.set("n", "<leader>gp", "<CMD>Git push<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>gd", "<CMD>Git diff<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>gl", "<CMD>Git log<CR>", { noremap = true, silent = true })
  end
}
