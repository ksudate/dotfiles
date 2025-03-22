vim.g.mapleader = " "

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0

local opt = vim.opt

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.cmdheight = 0
opt.mousescroll = "ver:1,hor:4"
opt.shell = "zsh"
opt.scrolloff = 10
opt.sidescrolloff = 10

vim.cmd("language en_US")
