local is = require 'is'
local util = require 'utils'
-- git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
-- git clone https://github.com/wbthomason/packer.nvim '$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim'
-- packar https://qiita.com/delphinus/items/8160d884d415d7425fcc
--

local function startup(use)
	use 'wbthomason/packer.nvim' -- https://github.com/wbthomason/packer.nvim
	use 'nvim-lua/popup.nvim'

	-- =================================================================================
	-- dcc
	use { 'Shougo/ddc.vim',          requires = {'vim-denops/denops.vim'} }
	use { 'Shougo/ddc-around',       requires = {'Shougo/ddc.vim'} }
	use { 'Shougo/ddc-matcher_head', requires = {'Shougo/ddc.vim'} }
	use { 'Shougo/ddc-sorter_rank',  requires = {'Shougo/ddc.vim'} }
	use { 'Shougo/ddc-nvim-lsp',     requires = {'Shougo/ddc.vim'} }

	-- =================================================================================
	-- git
	use 'tpope/vim-fugitive' -- https://github.com/tpope/vim-fugitive
	-- git browse
	use 'tpope/vim-rhubarb' -- https://qiita.com/takayama/items/de4341fb8f015ffe4750#tpopevim-rhubarb

	-- =================================================================================
	-- lsp
	use 'neovim/nvim-lspconfig'
	-- use 'dense-analysis/ale'

	-- =================================================================================
	-- filler
	use {
		'Shougo/defx.nvim',
		requires = {'roxma/nvim-yarp', 'roxma/vim-hug-neovim-rpc'}
	} -- https://github.com/Shougo/defx.nvim

	use 'mileszs/ack.vim' -- https://github.com/mileszs/ack.vim
	-- https://qiita.com/Biacco/items/b750c073a92a8e9fea7d

	-- =================================================================================
	-- utils
	use 'skanehira/translate.vim' -- :Translate で翻訳できる
	use 'mattn/emmet-vim'

	-- =================================================================================
	-- syntax
	-- dir searcher
	use {
		'nvim-telescope/telescope.nvim',
		requires = {'nvim-lua/plenary.nvim', 'kdheepak/lazygit.nvim'}
	} -- https://github.com/nvim-telescope/telescope.nvim#usage

	if is.mac then
		use 'nvim-treesitter/nvim-treesitter'
		use 'christianchiarulli/nvcode-color-schemes.vim'
		-- =================================================================================
	end

    if is.windows then
        use {'tikhomirov/vim-glsl',         ft = {'glsl'}}
        use { 'elzr/vim-json',              ft = { 'json' }}
        use { 'groenewege/vim-less',        ft = { 'less' } }
        use { 'stephpy/vim-yaml',           ft = {'swift'} }
        use { 'keith/swift.vim',            ft = {'yaml'} }
        use { 'digitaltoad/vim-jade',       ft = {'jade'} }
        use { 'wavded/vim-stylus',          ft = {'stylus'} }
        use { 'StanAngeloff/php.vim',       ft = {'php'} }
        use { 'kchmck/vim-coffee-script',   ft = {'coffee'} }
        use { 'dag/vim-fish',               ft = {'fish'} }
        use { 'cespare/vim-toml',           ft = {'toml'} }
        use { 'yuezk/vim-js',               ft = {'javascript', 'javascript.jsx'} }
        use { 'maxmellon/vim-jsx-pretty',   ft = {'javascript', 'javascript.jsx'} }
        use {'peitalin/vim-jsx-typescript', ft = {'typescript, typescript.tsx'}, requires = { 'leafgarland/typescript-vim' }}
    end
end

if util.isModuleAvailable 'packer' then require'packer'.startup(startup) end
