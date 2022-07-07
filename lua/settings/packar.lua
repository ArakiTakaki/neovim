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
	-- languages

	-- =================================================================================
	-- languages
	use { 'elzr/vim-json',               ft = {'json'} }
	use { 'groenewege/vim-less',         ft = {'less'} }
	use { 'stephpy/vim-yaml',            ft = {'yaml'} }
	use { 'digitaltoad/vim-jade',        ft = {'jade'} }
	use { 'wavded/vim-stylus',           ft = {'stylus'} }
	use { 'StanAngeloff/php.vim',        ft = {'php'} }
	use { 'kchmck/vim-coffee-script',    ft = {'coffee'} }
	use { 'dag/vim-fish',                ft = {'fish'} }
	use { 'cespare/vim-toml',            ft = {'toml'} }
	use { 'posva/vim-vue',               ft = {'vue'} }
	use { 'yuezk/vim-js',                ft = {'javascript', 'javascript.jsx'} }
	use { 'maxmellon/vim-jsx-pretty',    ft = {'javascript', 'javascript.jsx'} }
	use { 'peitalin/vim-jsx-typescript', ft = {'typescript', 'typescript.tsx'} }
	use { 'leafgarland/typescript-vim',  ft = {'typescript', 'typescript.tsx'} } -- deps
end

if Util.isModuleAvailable('packer') then
	require('packer').startup(startup)
end
