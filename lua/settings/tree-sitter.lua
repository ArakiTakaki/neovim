local util = require 'utils'
-- https://zenn.dev/duglaser/articles/c02d6a937a48df
-- https://lab.mo-t.com/blog/neovim-v05-introduction-new-features-part-2
if util.isModuleAvailable('nvim-treesitter.configs') then
	require'nvim-treesitter.configs'.setup {
	  highlight = {
	    enable = true,  -- syntax highlightを有効にする
	    disable = {     -- 一部の言語では無効にする
	      'lua',
	      'ruby',
	      'toml',
	      'c_sharp',
	      'vue',
	    }
	  }
	}
end
