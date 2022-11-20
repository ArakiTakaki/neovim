
-- local Commands = {
--     Format = function() vim.lsp.buf.format { async = true } end,
--     Rename = function() vim.lsp.buf.rename() end,
--     CodeAction = function() vim.lsp.buf.code_action() end,
--     CodeDefinition = function() vim.lsp.buf.hover() end,
-- }

vim.api.nvim_create_user_command(
    'Format',
    function()
        vim.lsp.buf.format { async = true }
    end, {}
)

vim.api.nvim_create_user_command(
    'Rename',
    function()
        vim.lsp.buf.rename()
    end, {}
)

vim.api.nvim_create_user_command(
    'CodeAction',
    function()
        vim.lsp.buf.code_action()
    end, {}
)

vim.api.nvim_create_user_command(
    'CodeDefinition',
    function()
        vim.lsp.buf.hover()
    end, {}
)
