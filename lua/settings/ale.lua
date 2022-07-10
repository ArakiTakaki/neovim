local isFix = false
-- packer config が動作し次第移植
if isFix then
    vim.cmd[[
    let g:ale_fixers = {
    \   'typescript': ['prettier'],
    \   'typescriptreact': ['prettier'],
    \   'javascript': ['prettier'],
    \   'javascriptreact': ['prettier'],
    \   'vue': ['prettier'],
    \   'css': ['prettier'],
    \}
    ]]
end

vim.cmd[[

let g:ale_sign_error = 'P>'
let g:ale_sign_warning = 'P-'
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_statusline_format = ['E%d', 'W%d', 'OK']
let g:ale_pattern_options = {
\   '.*\.json$': {'ale_enabled': 0},
\}
nmap <silent> <C-w>j <Plug>(ale_next_wrap)
nmap <silent> <C-w>k <Plug>(ale_previous_wrap)
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma all'
]]