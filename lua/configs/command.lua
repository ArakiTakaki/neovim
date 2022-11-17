vim.cmd 'command! Format lua vim.lsp.buf.format { async = true }'

vim.cmd 'command! Rename lua vim.lsp.buf.rename()'
vim.cmd 'command! CodeAction lua vim.lsp.buf.code_action()'
vim.cmd 'command! CodeDefinition lua vim.lsp.buf.hover()'

