local util = require 'utils'

-- ref https://github.com/ArakiTakaki/dotfiles/blob/master/configrations/.config/nvim/dein.toml
if util.isModuleAvailable 'lspconfig' then
    local nvim_lsp = require('lspconfig')

    local on_attach = function(client, bufnr)
        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        local function buf_set_option(...)
            vim.api.nvim_buf_set_option(bufnr, ...)
        end
        local opts = {noremap = true, silent = true}

        buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- K hover
	buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)

	-- [d エラーなどのメッセージ箇所へ移動
	buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)

	-- gd 宣言ファイルへ移動
	buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    end

    nvim_lsp.tsserver.setup {
        on_attach = on_attach,
        filetypes = {
            'javascript', 'typescript', 'typescriptreact', 'typescript.tsx'
        }
    }
    local lsps = {
        vuels = {},
        gopls = {},
        tsserver = {
            filetypes = {
                'javascript', 'typescript', 'typescriptreact', 'typescript.tsx'
            },
            root_dir = nvim_lsp.util.root_pattern('package.json')
        },
        denols = {
            filetypes = {
		'none',
            },
        }
    }

    for k, v in pairs(lsps) do
        nvim_lsp[k].setup {
            on_attach = on_attach,
            filetypes = v.filetypes,
            root_dir = v.root_dir
        }
    end
end

