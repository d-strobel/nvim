vim.api.nvim_create_autocmd('filetype', {
  pattern = 'netrw',
  desc = 'Better mappings for netrw',
  callback = function()
    local bind = function(lhs, rhs)
      vim.keymap.set('n', lhs, rhs, {remap = true, buffer = true})
    end

    -- Keymaps
    bind('n', '%') -- new file
    bind('r', 'R') -- rename file
    bind('l', '<CR>') -- select file

  end
})

-- Global keymaps
vim.keymap.set("n", "<leader>e", "<CMD>Explore<CR>")
