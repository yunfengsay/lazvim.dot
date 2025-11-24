-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- 禁用 Markdown 的拼写检查，避免大量红色波浪线
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  group = vim.api.nvim_create_augroup("user_markdown_nospell", { clear = true }),
  callback = function(event)
    -- spell 是 window-local 选项，需用 setlocal 方式修改
    vim.api.nvim_set_option_value("spell", false, { scope = "local" })
  end,
})
