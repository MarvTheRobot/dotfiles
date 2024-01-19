-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
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

map("n", "<silent> <c-h>", ':lua require("tmux").move_left()<cr>')
map("n", "<silent> <c-j>", ':lua require("tmux").move_bottom()<cr>')
map("n", "<silent> <c-k>", ':lua require("tmux").move_top()<cr>')
map("n", "<silent> <c-l>", ':lua require("tmux").move_right()<cr>')
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map({ "n", "v" }, "<leader>y", [["+y]])
map("x", "<leader>p", [["_dP]])
