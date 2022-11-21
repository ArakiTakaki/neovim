local vim = vim
-- local Commands = {
--     Format = function() vim.lsp.buf.format { async = true } end,
--     Rename = function() vim.lsp.buf.rename() end,
--     CodeAction = function() vim.lsp.buf.code_action() end,
--     CodeDefinition = function() vim.lsp.buf.hover() end,
-- }

local codeFormat = function()
	vim.lsp.buf.format { async = true }
end
vim.api.nvim_create_user_command('CodeFormat', codeFormat, {})

local codeRename = function()
	vim.lsp.buf.rename()
end
vim.api.nvim_create_user_command('CodeRename', codeRename, {})

local codeActionEvent = function()
	vim.lsp.buf.code_action()
end
vim.api.nvim_create_user_command('CodeAction', codeActionEvent, {})
vim.keymap.set("n", "<Space>i", codeActionEvent, {})

local codeDefinition = function()
	vim.lsp.buf.definition()
end
vim.api.nvim_create_user_command('CodeDefinition', codeDefinition, {})

local codeDeclaration = function()
	vim.lsp.buf.declaration()
end
vim.api.nvim_create_user_command('CodeDeclaration', codeDeclaration, {})

local codeHover = function()
	vim.lsp.buf.hover()
end
vim.api.nvim_create_user_command('CodeHover', codeHover, {})

