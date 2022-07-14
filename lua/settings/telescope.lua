local util = require 'utils'
local is = require 'is'

if util.isModuleAvailable 'telescope' and is.mac then
    require'telescope'.load_extension 'lazygit'
    require'telescope'.setup {
        defaults = {file_ignore_patterns = {'node_modules'}},
        pickers = {find_files = {theme = 'dropdown'}}
    }
end

-- packer config が動作し次第移植
vim.cmd [[
"=====================================================================
" termguicolors
"=====================================================================
" configure nvcode-color-schemes
let g:nvcode_termcolors=256
colorscheme nvcode " Or whatever colorscheme you make
" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
]]
