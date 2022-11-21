local vim = vim
local util = require 'utils'
local is = require 'is'

if util.isModuleAvailable 'telescope' and not (is.windows) then
	local telescope = require 'telescope'
	local fb_actions = require 'telescope'.extensions.file_browser.actions

	telescope.setup {
		defaults = {
			file_ignore_patterns = { "node%_modules/.*" }
		},
		pickers = { find_files = { theme = 'dropdown' } },
		extensions = {
			file_browser = {
				-- theme = "ivy",
				theme = "dropdown",
				path = '%:p:h',
				cwd = 'telescope_buffer_dir()',
				respect_gitignore = false,
				hidden = true,
				grouped = false,
				previewr = false,
				initial_mode = 'normal',
				layout_config = { height = 40 },
				hijack_netrw = true,

				mappings = {
					["i"] = {
					},
					["n"] = {
						["N"] = fb_actions.create,
						["h"] = fb_actions.goto_parent_dir,
						["/"] = function()
							vim.cmd 'startinsert'
						end,
					},
				},
			},
		},
	}

	telescope.load_extension 'file_browser'
	telescope.load_extension 'lazygit'
end
