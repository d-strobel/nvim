return {
  "nvim-tree/nvim-tree.lua",
  config = function()
      local nvimtree = require("nvim-tree")

      -- recommended settings from nvim-tree documentation
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- change color for arrows in tree to light blue
      vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
      vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

      local function on_attach(bufnr)
        local api = require("nvim-tree.api")

        -- Keymaps
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
        vim.keymap.set("n", "n", api.fs.create, opts "New file / directory")
      end

      -- configure nvim-tree
      nvimtree.setup({
        -- set nvim-tree keymaps on attach
        on_attach = on_attach,

        view = {
          width = 30,
        },
        -- change folder arrow icons
        renderer = {
          indent_markers = {
            enable = true,
          },
          icons = {
            show = {
              file = false,
              folder = false,
              folder_arrow = true,
              git = false,
            }
          }
        },
        -- disable window_picker for
        -- explorer to work well with
        -- window splits
        actions = {
          open_file = {
            window_picker = {
              enable = false,
            },
          },
        },
        filters = {
          dotfiles = false,
          custom = { ".DS_Store", "^.git$" },
        },
        git = {
          ignore = false,
        },
      })

      -- set keymaps
      local keymap = vim.keymap
      keymap.set("n", "<leader>t", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) 
      keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Focues file explorer" }) 
  end
}
