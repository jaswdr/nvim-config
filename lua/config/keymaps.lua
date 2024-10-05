-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Toggle Neotree left side panel
vim.keymap.set("n", "<C-e>", ":Neotree toggle<CR>", { silent = true })

-- Create new buffer and set current buffer to the new buffer
vim.keymap.set("n", "<C-t>", function()
  local buf = vim.api.nvim_create_buf(true, false)
  vim.api.nvim_set_current_buf(buf)
end, { silent = true })

vim.keymap.set("n", "<C-x>", ":bdelete<CR>")

local folders_to_search = "lib/**/* src/**/* tests/**/* tst/**/* spec/**/*"

vim.keymap.set("n", "<C-f>", function()
  local search_term = vim.fn.input("Search: ")
  vim.cmd("silent! vimgrep /" .. search_term .. "/ " .. folders_to_search)
  vim.cmd("silent! copen")
end)

function SearchSelection()
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local lines = vim.fn.getline(start_pos[2], end_pos[2])
  local selection = table.concat(lines, "\n"):sub(start_pos[3], end_pos[3])
  vim.cmd("silent! vimgrep /" .. selection .. "/ " .. folders_to_search)
  vim.cmd("silent! copen")
end

vim.api.nvim_set_keymap("v", "<C-h>", ":lua SearchSelection()<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-g>", ":Gen Complete_Code<CR>")
vim.keymap.set("n", "<C-a>", ":Gen Generate<CR>")
vim.keymap.set("n", "<C-c>", ":Gen Chat<CR>")
