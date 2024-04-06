return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },

  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local windows = require('lspconfig.ui.windows')

    -- used for keymaps
    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }

    -- on attach keymaps
    local on_attach = function(_, bufnr)
      opts.buffer = bufnr

      -- Set keymaps
      opts.desc = "Show LSP references"
      keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

      opts.desc = "Go to declaration"
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

      opts.desc = "Show LSP definitions"
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

      opts.desc = "Show LSP implementations"
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

      opts.desc = "Show LSP type definitions"
      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

      opts.desc = "See available code actions"
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

      opts.desc = "Show documentation for what is under cursor"
      keymap.set({ "n", "i" }, "<C-h>", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

      vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    end

    -- set the border for floating windows
    windows.default_options.border = "rounded"

    vim.lsp.handlers["textDocument/hover"] =
        vim.lsp.with(
          vim.lsp.handlers.hover,
          {
            border = "rounded"
          }
        )

    vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(
          vim.lsp.handlers.signature_help,
          {
            border = "rounded"
          }
        )

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- configure ansible server
    lspconfig["ansiblels"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "yaml", "ansible" },
    })

    -- configure golang server
    lspconfig["gopls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure terraform server
    lspconfig["terraformls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "terraform", "terraform-vars" },
    })

    -- configure lua server (with special settings)
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })

    -- Rust lsp config
    lspconfig["rust_analyzer"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- Powershell lsp config
    lspconfig["powershell_es"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      -- bundle_path = "/home/dstrobel/.local/share/nvim/mason/packages/powershell-editor-services",
      bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services",
      -- cmd = { "pwsh", "-NoLogo", "-Command", "[[& '%s/PowerShellEditorServices/Start-EditorServices.ps1' -BundledModulesPath '%s' -LogPath '%s/powershell_es.log' -SessionDetailsPath '%s/powershell_es.session.json' -FeatureFlags @() -AdditionalModules @() -HostName nvim -HostProfileId 0 -HostVersion 1.0.0 -Stdio -LogLevel Normal]]" },
    })

    -- SlintUI lsp config
    lspconfig["slint_lsp"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end,
}
