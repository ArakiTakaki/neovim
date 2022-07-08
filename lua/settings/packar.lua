local Util = require 'utils'

--
-- git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
-- git clone https://github.com/wbthomason/packer.nvim '$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim'
-- packar https://qiita.com/delphinus/items/8160d884d415d7425fcc
--

local function startup(use)
	use 'wbthomason/packer.nvim' -- https://github.com/wbthomason/packer.nvim
	use 'nvim-lua/popup.nvim'

	-- =================================================================================
	-- git
	use 'tpope/vim-fugitive' -- https://github.com/tpope/vim-fugitive
	-- git browse
	use 'tpope/vim-rhubarb' -- https://qiita.com/takayama/items/de4341fb8f015ffe4750#tpopevim-rhubarb
	use 'nvim-telescope/telescope.nvim' -- https://github.com/nvim-telescope/telescope.nvim#usage
	-- deps
	use 'nvim-lua/plenary.nvim'
	use 'kdheepak/lazygit.nvim'

	-- =================================================================================
	-- lsp
	use 'neovim/nvim-lspconfig'
	use 'dense-analysis/ale'

	-- =================================================================================
	-- filler
	use 'Shougo/defx.nvim' -- https://github.com/Shougo/defx.nvim
	use 'roxma/nvim-yarp'          -- deps
	use 'roxma/vim-hug-neovim-rpc' -- deps

	use 'mileszs/ack.vim' -- https://github.com/mileszs/ack.vim
	-- https://qiita.com/Biacco/items/b750c073a92a8e9fea7d

	-- =================================================================================
	-- utils
	use 'skanehira/translate.vim' -- :Translate で翻訳できる

	-- =================================================================================
	-- syntax
	use 'christianchiarulli/nvcode-color-schemes.vim'
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
end

if Util.isModuleAvailable('packer') then
	require('packer').startup(startup)
end
