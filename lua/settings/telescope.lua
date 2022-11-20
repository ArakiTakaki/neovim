local util = require 'utils'
local is = require 'is'

if util.isModuleAvailable 'telescope' and not (is.windows) then
	local telescope = require 'telescope'
	telescope.setup {
		defaults = {
			file_ignore_patterns = { "node%_modules/.*" }
		},

		pickers = { find_files = { theme = 'dropdown' } },
		extensions = {
			file_browser = {
				-- theme = "dropdown",
				theme = "ivy",
				hijack_netrw = true,
				mappings = {
					["i"] = {
						-- your custom insert mode mappings
					},
					["n"] = {
						-- your custom normal mode mappings
					},
				},
			},
		},
	}

	vim.api.nvim_set_keymap(
		"n",
		"fgrep",
		":lua require('telescope.builtin').live_grep()<cr>",
		{ noremap = true }
	)

	telescope.load_extension 'file_browser'
	telescope.load_extension 'lazygit'
end
