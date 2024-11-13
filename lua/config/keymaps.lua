-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-e>", ":Neotree toggle current reveal_force_cwd<cr>")

local ts = require("telescope.builtin")

-- search in current file
vim.keymap.set("n", "<C-f>", ts.current_buffer_fuzzy_find)

-- grep for content in files
vim.keymap.set("n", "<C-g>", ts.live_grep)

-- commands history
vim.keymap.set("n", "<C-h>", ts.command_history)

-- marks
vim.keymap.set("n", "<C-m>", ts.marks)

-- create new buffer
vim.keymap.set("n", "<C-t>", function()
  local buf = vim.api.nvim_create_buf(true, false)
  vim.api.nvim_set_current_buf(buf)
end)

-- delete current buffer
vim.keymap.set("n", "<C-x>", function()
  local buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_delete(buf, { force = true })
end)
