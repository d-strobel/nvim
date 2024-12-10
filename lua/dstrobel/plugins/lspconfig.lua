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
      keymap.set("n", "gR", require('telescope.builtin').lsp_references, opts)
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      keymap.set("n", "gd", require('telescope.builtin').lsp_definitions, opts)
      keymap.set("n", "gi", require('telescope.builtin').lsp_implementations, opts)
      keymap.set("n", "gt", require('telescope.builtin').lsp_type_definitions, opts)
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
      keymap.set({ "n", "i" }, "<ca-h>", vim.lsp.buf.hover, opts)
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
      keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
      keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
      keymap.set("n", "<leader>ih", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}), {}) end,
        opts)

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
      filetypes = { "tf", "terraform", "terraform-vars" },
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
      bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services",
    })

    -- JSON lsp config
    lspconfig["jsonls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- Dockerfile lsp config
    lspconfig["dockerls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- HTML lsp config
    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    --
    -- HTMX lsp config
    lspconfig["htmx"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- Tailwind CSS lsp config
    lspconfig["tailwindcss"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- Python lsp config
    lspconfig["pylsp"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end,
}
