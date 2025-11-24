-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Use absolute line numbers instead of relative
vim.opt.relativenumber = false
vim.opt.number = true

-- Disable cursor animations and smooth scrolling
vim.opt.cursorline = false
vim.opt.scrolloff = 0
vim.g.snacks_animate = false

-- Fix popup menu background
vim.opt.pumblend = 0
