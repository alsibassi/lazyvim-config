-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Swap j and k (everywhere)
vim.keymap.set({ "n", "v", "o", "x" }, "j", "k", { noremap = true })
vim.keymap.set({ "n", "v", "o", "x" }, "k", "j", { noremap = true })

-- Also swap gj/gk (visual line movement)
vim.keymap.set({ "n", "v" }, "gj", "gk", { noremap = true })
vim.keymap.set({ "n", "v" }, "gk", "gj", { noremap = true })

-- Swap in command-line and insert mode (for popup menus)
vim.keymap.set("c", "<C-j>", "<C-k>", { noremap = true })
vim.keymap.set("c", "<C-k>", "<C-j>", { noremap = true })
vim.keymap.set("i", "<C-j>", "<C-k>", { noremap = true })
vim.keymap.set("i", "<C-k>", "<C-j>", { noremap = true })

vim.keymap.set('n', '<leader>yd', function()
  local diags = vim.diagnostic.get(0, { lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })
  if diags[1] then
    local file = vim.fn.expand('%:p')
    local line = diags[1].lnum + 1
    local text = file .. ':' .. line .. ': ' .. diags[1].message
    vim.fn.setreg('+', text)
    print('Copied: ' .. text)
  end
end, { desc = 'Yank diagnostic' })
