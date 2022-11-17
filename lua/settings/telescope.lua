local util = require 'utils'
local is = require 'is'

if util.isModuleAvailable 'telescope' and not (is.windows) then
	require 'telescope'.load_extension 'lazygit'
	require 'telescope'.setup {
		defaults = {
			file_ignore_patterns = { "node%_modules/.*" }
		},
		pickers = { find_files = { theme = 'dropdown' } }
	}
end
