local util = require 'utils'
-- ref https://github.com/williamboman/mason.nvim
if util.isModuleAvailable 'mason' then
	require('mason').setup({
		ui = {
			icons = {
				package_installed = "v",
				package_pending = "->",
				package_uninstalled = "x"
			}
		}
	})

	if util.isModuleAvailable 'mason-lspconfig' then
		require('mason-lspconfig').setup_handlers({ function(server)
			local opt = {
				-- -- Function executed when the LSP server startup
				-- on_attach = function(client, bufnr)
				--   local opts = { noremap=true, silent=true }
				--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
				--   vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)'
				-- end,
				capabilities = require('cmp_nvim_lsp').default_capabilities(
					vim.lsp.protocol.make_client_capabilities()
				)
			}
			require('lspconfig')[server].setup(opt)
		end })
	end
end
