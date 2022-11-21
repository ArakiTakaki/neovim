local util = require 'utils'

if util.isModuleAvailable 'lspconfig' then
	require 'lspconfig'.sumneko_lua.setup {
		settings = {
			Lua = {
				diagnostics = {
					globals = { 'vim' },
				},
			},
		},
	}
end
