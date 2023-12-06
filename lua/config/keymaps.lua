-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here


-- Toggle Neotree left side panel
vim.keymap.set('n', '<C-e>', ':Neotree toggle<CR>', { silent = true })
