require "custom.autocmds"

vim.cmd "silent! command! EnableShade lua require('shade').toggle()"
vim.opt.relativenumber = true
