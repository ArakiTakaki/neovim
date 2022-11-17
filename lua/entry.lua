vim.cmd [[packadd packer.nvim]]

require('configs.env')
require('configs.key')
require('configs.indent')
require('configs.command')

require('settings.mason')
require('settings.packar')
require('settings.cmp')
require('settings.ack')
require('settings.telescope')
require('settings.tree-sitter')
