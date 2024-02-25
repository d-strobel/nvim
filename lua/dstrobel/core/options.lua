-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Linebreak
vim.opt.wrap = false

-- Curser
vim.opt.cursorline = true

-- Indenting
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Searching
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Scrollin
vim.opt.scrolloff = 10

-- Neovide
if vim.g.neovide then
  vim.o.guifont = "Source Code Pro:h11"
end
