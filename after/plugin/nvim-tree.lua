local api = require("nvim-tree.api")

-- Keymaps
vim.keymap.set('n', '<leader>pv', ":NvimTreeToggle<CR>")
vim.keymap.set('n', '<leader>pf', ":NvimTreeFocus<CR>")

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Keymappings on attach
local function on_attach(bufnr)
  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  vim.keymap.set("n", "l", api.node.open.edit, opts "Open")
  vim.keymap.set("n", "<CR>", api.node.open.edit, opts "Open")
  vim.keymap.set("n", "r", api.fs.rename_sub, opts "Rename")
  vim.keymap.set("n", "q", api.tree.close, opts "Close")
  vim.keymap.set("n", "p", api.fs.paste, opts "Paste file")
  vim.keymap.set("n", "y", api.fs.copy.node, opts "Copy file")
  vim.keymap.set("n", "d", api.fs.remove, opts "Delete file")
  vim.keymap.set("n", "R", api.tree.reload, opts "Reload tree")
end

require("nvim-tree").setup({
  on_attach = on_attach,
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
    add_trailing = false,
    highlight_git = true,
    full_name = false,
    indent_markers = {
      enable = true,
    },
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = true,
        git = false,
      },
    },
  },
  filters = {
    dotfiles = false,
    custom = { "^.git$" }
  },
})
