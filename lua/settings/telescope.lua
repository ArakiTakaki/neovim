local util = require 'utils'
local is = require 'is'

if util.isModuleAvailable 'telescope' and is.mac then
    require'telescope'.load_extension 'lazygit'
    require'telescope'.setup {
        defaults = {file_ignore_patterns = {'node_modules'}},
        pickers = {find_files = {theme = 'dropdown'}}
    }
end
