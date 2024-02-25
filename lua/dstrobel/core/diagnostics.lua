-- Diagnostic settings
vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        -- header = '',
        -- prefix = '',
    },
})

-- Change border colors
-- wrap open_float to inspect diagnostics and use the severity color for border
-- https://neovim.discourse.group/t/lsp-diagnostics-how-and-where-to-retrieve-severity-level-to-customise-border-color/1679
vim.diagnostic.open_float = (function(orig)
    return function(bufnr, opts)
        local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
        local opts = opts or {}
        -- A more robust solution would check the "scope" value in `opts` to
        -- determine where to get diagnostics from, but if you're only using
        -- this for your own purposes you can make it as simple as you like
        local diagnostics = vim.diagnostic.get(opts.bufnr or 0, {lnum = lnum})
        local max_severity = vim.diagnostic.severity.HINT
        for _, d in ipairs(diagnostics) do
            -- Equality is "less than" based on how the severities are encoded
            if d.severity < max_severity then
                max_severity = d.severity
            end
        end
        local border_color = ({
            [vim.diagnostic.severity.HINT]  = "DiagnosticHint",
            [vim.diagnostic.severity.INFO]  = "DiagnosticInfo",
            [vim.diagnostic.severity.WARN]  = "DiagnosticWarn",
            [vim.diagnostic.severity.ERROR] = "DiagnosticError",
        })[max_severity]
        opts.border = {
            {"╔", border_color},
            {"═", border_color},
            {"╗", border_color},
            {"║", border_color},
            {"╝", border_color},
            {"═", border_color},
            {"╚", border_color},
            {"║", border_color},
        }

        -- Set background color
        opts.winblend = 10

        orig(bufnr, opts)
    end
end)(vim.diagnostic.open_float)

