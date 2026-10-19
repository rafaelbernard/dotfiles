require("config.remote_clipboard").setup()
-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- phpactor (the LazyVim default) needs a php binary on PATH; intelephense only needs node.
vim.g.lazyvim_php_lsp = "intelephense"
