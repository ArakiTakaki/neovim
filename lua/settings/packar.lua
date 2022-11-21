local vim = vim
local is = require 'is'
local util = require 'utils'

-- git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
-- git clone https://github.com/wbthomason/packer.nvim '$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim'
-- packar https://qiita.com/delphinus/items/8160d884d415d7425fcc
--

local function startup(use)
	-- =================================================================================
	-- base
	-- =================================================================================
	use 'wbthomason/packer.nvim' -- https://github.com/wbthomason/packer.nvim

	-- =================================================================================
	-- utils
	-- =================================================================================
	use 'nvim-lua/popup.nvim'
	use 'skanehira/translate.vim' -- :Translate で翻訳できる
	use 'mattn/emmet-vim'
	use 'kyazdani42/nvim-web-devicons'

	-- =================================================================================
	-- git
	-- =================================================================================
	use 'tpope/vim-fugitive' -- https://github.com/tpope/vim-fugitive
	use 'tpope/vim-rhubarb' -- https://qiita.com/takayama/items/de4341fb8f015ffe4750#tpopevim-rhubarb
	use 'kdheepak/lazygit.nvim'

	-- =================================================================================
	-- lsp
	-- =================================================================================
	use 'neovim/nvim-lspconfig'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'

	-- =================================================================================
	-- cmp plugins
	-- =================================================================================
	use 'hrsh7th/nvim-cmp' -- The completion plugin
	use 'hrsh7th/cmp-buffer' -- buffer completions
	use 'hrsh7th/cmp-path' -- path completions
	use 'hrsh7th/cmp-cmdline' -- cmdline completions
	use 'saadparwaiz1/cmp_luasnip' -- snippet completions
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-nvim-lua'

	-- =================================================================================
	-- dir searcher
	-- =================================================================================
	use 'mileszs/ack.vim' -- https://github.com/mileszs/ack.vim https://qiita.com/Biacco/items/b750c073a92a8e9fea7d
	use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' }} -- https://github.com/nvim-telescope/telescope.nvim#usage
	use { 'nvim-telescope/telescope-file-browser.nvim', requires = {{ 'nvim-telescope/telescope.nvim' }}}

	-- =================================================================================
	-- syntax highlight
	-- =================================================================================
	if is.mac or is.linux then
		use { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } }
		use 'christianchiarulli/nvcode-color-schemes.vim'
	end

	if is.windows then
		use { 'tikhomirov/vim-glsl', ft = { 'glsl' } }
		use { 'elzr/vim-jsohttps://github.com/ArakiTakaki/ArakiTakaki/blob/master/setup/mac.shn', ft = { 'json' } }
		use { 'groenewege/vim-less', ft = { 'less' } }
		use { 'stephpy/vim-yaml', ft = { 'swift' } }
		use { 'keith/swift.vim', ft = { 'yaml' } }
		use { 'digitaltoad/vim-jade', ft = { 'jade' } }
		use { 'wavded/vim-stylus', ft = { 'stylus' } }
		use { 'StanAngeloff/php.vim', ft = { 'php' } }
		use { 'kchmck/vim-coffee-script', ft = { 'coffee' } }
		use { 'dag/vim-fish', ft = { 'fish' } }
		use { 'cespare/vim-toml', ft = { 'toml' } }
		use { 'yuezk/vim-js', ft = { 'javascript', 'javascript.jsx' } }
		use { 'maxmellon/vim-jsx-pretty', ft = { 'javascript', 'javascript.jsx' } }
		use { 'peitalin/vim-jsx-typescript', ft = { 'typescript, typescript.tsx' }, requires = { 'leafgarland/typescript-vim' } }
	end
end

if util.isModuleAvailable 'packer' then require 'packer'.startup(startup) end
