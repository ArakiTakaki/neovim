local util = require 'utils'
local is = require 'is'

-- https://zenn.dev/duglaser/articles/c02d6a937a48df
-- https://lab.mo-t.com/blog/neovim-v05-introduction-new-features-part-2

local disable = util.ternary(is.windows,
                             {'ruby', 'toml', 'c_sharp', 'lua', 'glsl', 'vim'},
                             {'ruby', 'toml', 'c_sharp'});

if util.isModuleAvailable 'nvim-treesitter.configs' then
    require'nvim-treesitter.configs'.setup {
        highlight = {
            enable = true, -- syntax highlightを有効にする
            auto_install = true,
            disable = disable
        }
    }
end
