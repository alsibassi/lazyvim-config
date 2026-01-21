return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    { "<C-t>", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Toggle Terminal (vertical)" },
  },
  config = function()
    require("toggleterm").setup({
      size = 40,
      direction = "vertical",
    })
  end,
}
