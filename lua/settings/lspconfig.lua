local util = require 'utils'

-- if util.isModuleAvailable('lspconfig') then
-- end

local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
	local opts = { noremap = true, silent = true }
	buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

nvim_lsp.tsserver.setup {
	on_attach = on_attach,
	filetypes = { 'javascript', 'typescript', 'typescriptreact', 'typescript.tsx' }
}
