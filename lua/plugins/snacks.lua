-- Configure Snacks to show hidden and gitignored files
return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        hidden = true,
        ignored = true,
        win = {
          input = {
            keys = {
              ["<c-j>"] = { "list_up", mode = { "i", "n" } },
              ["<c-k>"] = { "list_down", mode = { "i", "n" } },
            },
          },
          list = {
            keys = {
              ["j"] = "list_up",
              ["k"] = "list_down",
            },
          },
        },
      },
      explorer = {
        hidden = true,
        ignored = true,
        win = {
          list = {
            keys = {
              ["j"] = "list_up",
              ["k"] = "list_down",
            },
          },
        },
      },
      gitbrowse = {
        win = {
          list = {
            keys = {
              ["j"] = "list_up",
              ["k"] = "list_down",
            },
          },
        },
      },
    },
  },
}
