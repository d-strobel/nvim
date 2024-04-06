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

-- backspace
vim.opt.backspace = "indent,eol,start"

-- Searching
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Scrollin
vim.opt.scrolloff = 8

-- split windows
vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal window to the bottom

-- SlintUI filetype
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufNewFile' }, {
  pattern = '*.slint',
  command = 'set filetype=slint',
})

-- Neovide
if vim.g.neovide then
  vim.o.guifont = "Source Code Pro:h11"
  vim.g.neovide_transparency = 0.85
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_cursor_animation_length = 0.04
  vim.g.neovide_scroll_animation_length = 0.1
  vim.g.neovide_padding_top = 10
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 8
  vim.g.neovide_padding_left = 10
  vim.g.neovide_remember_window_size = true
end
