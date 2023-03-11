" " GENERAL
" autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
" autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" FORMATTERS
au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType vue setlocal formatprg=prettier\ --parser\ vue
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css
au FileType html setlocal formatprg=js-beautify\ --type\ html

" TREESITTER
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable                     " Disable folding at startup.

" VUE plugin
let g:vim_vue_plugin_config = { 
      \'syntax': {
      \   'template': ['html'],
      \   'script': ['javascript', 'typescript'],
      \   'style': ['css', 'sass', 'less'],
      \   'i18n': ['json', 'yaml'],
      \   'route': 'json',
      \},
      \'full_syntax': ['json'],
      \'initial_indent': ['i18n', 'i18n.json', 'yaml'],
      \'attribute': 1,
      \'keyword': 1,
      \'foldexpr': 1,
      \'debug': 0,
      \}

" keymapping move code
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
