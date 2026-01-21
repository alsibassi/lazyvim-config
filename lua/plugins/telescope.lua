-- Configure Telescope to show hidden files and gitignored files
return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
        end,
        desc = "Find Files (including hidden)",
      },
      {
        "<leader><space>",
        function()
          require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
        end,
        desc = "Find Files (including hidden)",
      },
    },
    opts = {
      defaults = {
        hidden = true,
      },
      pickers = {
        find_files = {
          hidden = true,
          no_ignore = true,
        },
        live_grep = {
          additional_args = { "--hidden", "--no-ignore" },
        },
      },
    },
  },
}
