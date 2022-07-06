if Util.isModuleAvailable('telescope') then
	require("telescope").load_extension("lazygit")
	require('telescope').setup{
		defaults = { file_ignore_patterns = {"node_modules"} },
		pickers = {
			find_files = {
				theme = "dropdown",
			}
		},
	}
end
