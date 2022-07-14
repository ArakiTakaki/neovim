local util = require 'utils'

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
        }
    }}

    for k, v in pairs(lsps) do
        nvim_lsp[k].setup {
            on_attach = on_attach,
            filetypes = v.filetypes
        }
    end
end
