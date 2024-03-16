return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      -- import nvim-treesitter plugin
      local treesitter = require("nvim-treesitter.configs")

      -- configure treesitter
      treesitter.setup({ -- enable syntax highlighting
        highlight = {
          enable = true,
        },
        -- enable indentation
        indent = { enable = true },
        -- ensure these language parsers are installed
        ensure_installed = {
          "json",
          "yaml",
          "html",
          "css",
          "markdown",
          "markdown_inline",
          "bash",
          "lua",
          "vim",
          "dockerfile",
          "gitignore",
          "go",
          "gomod",
          "gosum",
          "rust",
          "hcl",
          "terraform",
          "fish",
          "diff",
          "git_config",
          "promql",
          "toml"
        },
      })

      -- Specific filetypes
      vim.treesitter.language.register('hcl', 'terraform-vars') -- the someft filetype will use the python parser and queries.
    end
  }
}
