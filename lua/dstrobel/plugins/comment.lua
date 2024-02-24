return {
	{
    "numToStr/Comment.nvim",
    event = { "BufEnter" },
    config = function()
      local comment = require("Comment")

      -- Keymaps
      comment.setup({
        toggler = {
          line = '<leader>cl',
          block = '<leader>cb',
        },
        opleader = {
          line = '<leader>cl',
          block = '<leader>cb',
        },
        extra = {
          above = '<leader>cO',
          below = '<leader>co',
          eol = '<leader>cA',
        },
      })
    end,
	},
}
