return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",

  config = function()
    require("ibl").setup({
      scope = {
        enabled = false
      },
    })
  end
}
