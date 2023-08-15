-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Move to tmux pane using the <ctrl> hjkl keys
map("n", "<C-h>", ":TmuxNavigateLeft<cr>", { desc = "Go to left window", noremap = true, silent = true })
map("n", "<C-l>", ":TmuxNavigateRight<cr>", { desc = "Go to right window", noremap = true, silent = true })
map("n", "<C-j>", ":TmuxNavigateDown<cr>", { desc = "Go to lower window", noremap = true, silent = true })
map("n", "<C-k>", ":TmuxNavigateUp<cr>", { desc = "Go to upper window", noremap = true, silent = true })
