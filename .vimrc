" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~~~~~ Plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set nocompatible
call plug#begin()
" ------------------------------------------------
" --- Utility
" ------------------------------------------------
Plug 'tpope/vim-surround' " --- handy quick parentheses, brackets, ...
Plug 'tpope/vim-commentary' " --- comment code quickly
Plug 'tpope/vim-repeat' " --- repeat everything
Plug 'jiangmiao/auto-pairs' " --- pair and close everything automatically
Plug 'svermeulen/vim-easyclip' " --- d without copying
Plug 'alvan/vim-closetag' " --- close html tags
Plug 'terryma/vim-multiple-cursors' " --- like sublime
Plug 'mattn/emmet-vim' " --- faster html coding
Plug 'benmills/vimux' " --- send commands to tmux
Plug 'airblade/vim-rooter' " --- change root directory on the fly
Plug 'suan/vim-instant-markdown' " --- live markdown edit
Plug 'Shougo/unite.vim' " --- dev helper
Plug 'neovim/python-client' " --- support python for neovim
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }
" ------------------------------------------------
" --- Search & Navigate
" ------------------------------------------------
Plug 'chrisbra/improvedft' " --- better f and t
Plug 'Shougo/vimfiler.vim' " --- file explorer
Plug 'scrooloose/nerdtree' " --- file explorer
Plug 'jistr/vim-nerdtree-tabs' " --- nerdtree in all tabs
Plug 'unkiwii/vim-nerdtree-sync' " Sync open file to NERDTree
Plug 'ctrlpvim/ctrlp.vim' " --- fuzzy search
Plug 'mileszs/ack.vim' " --- ack built in
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " --- fuzzy search
Plug 'junegunn/fzf.vim' " extra fzf features
Plug 'majutsushi/tagbar' " --- tagbar sidebar
Plug 'junegunn/vim-slash' " --- improved searching
Plug 'tpope/vim-unimpaired' " --- awesome mappings
Plug 'joeytwiddle/sexy_scroller.vim' " --- animate scroll
Plug 'jlanzarotta/bufexplorer' " --- list buffers
Plug 'milkypostman/vim-togglelist' " --- toggle quicklist with one command
Plug 'christoomey/vim-tmux-navigator' " --- navigate between tmux and vim
Plug 'majutsushi/tagbar' " --- ctags outline
Plug 'junegunn/vim-slash' " --- better in-buffer search
Plug 'junegunn/vim-emoji' " --- emoji in vim
Plug 'Shougo/denite.nvim'
" ------------------------------------------------
" --- JS Syntax, Autocomplete & Linters
" ------------------------------------------------
Plug 'ervandew/supertab' " --- autocomplete with tabs
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'steelsojka/deoplete-flow'
Plug 'galooshi/vim-import-js', { 'do': 'npm install -g import-js' }
Plug 'billyvg/deoplete-import-js'
" Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mxw/vim-jsx'
" Plug 'chemzqm/vim-jsx-improve' " --- support React jsx correctly
" Plug 'othree/yajs.vim' " --- heavy lifting, disable for better performance
" Plug 'othree/es.next.syntax.vim' " --- experimental next ES version syntax
" Plug 'othree/javascript-libraries-syntax.vim'
" Plug 'jelera/vim-javascript-syntax' " JavaScript syntax
" Plug 'othree/jspc.vim' " function parameter completion
Plug 'w0rp/ale' " --- lint engine while typing better than neomake
Plug 'qpkorr/vim-bufkill' " --- kill buffs without destroying window/split
Plug 'jparise/vim-graphql'
Plug 'leafgarland/typescript-vim' " --- TS syntax highlighting
Plug 'mhartington/nvim-typescript', {'do': './install.sh'} " --- TS autocomplete
Plug 'posva/vim-vue' " --- vuejs
" ------------------------------------------------
" --- GO, C#, JAVA, Python
" ------------------------------------------------
Plug 'tpope/vim-dispatch' " --- asynchronous build and test dispatcher
Plug 'fatih/vim-go' " --- Go plugin
Plug 'zchee/deoplete-go' " --- Go completion
Plug 'AndrewRadev/splitjoin.vim' " --- GO split and join struct literals
" Plug 'OmniSharp/omnisharp-vim' " --- omnicompletion (intellisense) and more
Plug 'OrangeT/vim-csharp' " --- C# Enhancement's to Vim's C-Sharp Functionality
Plug 'python-mode/python-mode' " --- makes Vim a Python IDE
" ------------------------------------------------
" --- CSS
" ------------------------------------------------
Plug 'hail2u/vim-css3-syntax' " --- css3
Plug 'ap/vim-css-color' " --- css colors highlight
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'cakebaker/scss-syntax.vim' " --- sass
" ------------------------------------------------
" --- Git & Diff
" ------------------------------------------------
Plug 'tpope/vim-fugitive' " --- awesome git
Plug 'airblade/vim-gitgutter'
Plug 'will133/vim-dirdiff' " --- git diff for directories
Plug 'Xuyuanp/nerdtree-git-plugin' " --- nerdtree with git flags
Plug 'junegunn/gv.vim' " --- git commit browser
" ------------------------------------------------
" --- Look and feel
" ------------------------------------------------
Plug 'vim-airline/vim-airline' " lightweight line
Plug 'vim-airline/vim-airline-themes' " airline theme pack
Plug 'junegunn/goyo.vim' " --- distraction free mode
Plug 'amix/vim-zenroom2' " --- iA Writer environment when editing Markdown
Plug 'morhetz/gruvbox' " --- cool theme
Plug 'edkolev/tmuxline.vim' " --- tmux status for vim
Plug 'nathanaelkane/vim-indent-guides' " --- see indents clearly
" ------------------------------------------------
" --- Snippets using neosnippets with deoplete
" ------------------------------------------------
Plug 'Shougo/neosnippet.vim' " --- engine
Plug 'Shougo/neosnippet-snippets' " --- snippets #1
Plug 'honza/vim-snippets' " --- snippets #2
Plug 'rizzatti/dash.vim' " --- offline doc
call plug#end()


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~~~~~ Config ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
syntax enable
set number
function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction
let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))
if has('nvim')
  let g:deoplete#enable_at_startup = 1
  let g:SuperTabDefaultCompletionType = "<c-n>"
  let g:deoplete#sources#flow#flow_bin = g:flow_path
  set completeopt-=preview
  let g:neomake_warning_sign = {
  \ 'text': 'W',
  \ 'texthl': 'WarningMsg',
  \ }
  let g:neomake_error_sign = {
  \ 'text': 'E',
  \ 'texthl': 'ErrorMsg',
  \ }
  let g:neomake_javascript_enabled_makers = ['eslint', 'flow']
  let g:neomake_jsx_enabled_makers = ['eslint', 'flow']
  let g:neomake_javascript_flow_exe = g:flow_path
  let g:neomake_jsx_flow_exe = g:flow_path
  " autocmd! BufWritePost * Neomake
else
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_always_populate_loc_list = 0
  let g:syntastic_auto_jump = 0
  let g:syntastic_auto_loc_list = 0
  let g:syntastic_check_on_open = 0
  let g:syntastic_check_on_wq = 1
  let g:syntastic_javascript_checkers = ['eslint']
endif
let g:jsx_ext_required = 0 " Highlight JSX in .js files
nnoremap <C-T> :FZF<CR>
inoremap <C-T> <ESC>:FZF<CR>i


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~~~~~ Defaults settings ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set nocompatible " make vim usefull
let mapleader="," " leader key
set clipboard=unnamed " Use osx clipboard
set wildmenu " better completion
set lcs=tab:▸\ ,trail:#,nbsp:_ " Show “invisible” characters
set nobk " Don't create backup files 
set ai " Turn on auto indentation
set si " Turn on smart indent
set list
set foldcolumn=1 " extra margin to the left
set autoindent " Copy indent from last line when starting new line
set expandtab " use spaces instead of tabs
set mouse= " make cmd-c work
set smarttab " beginning of the line jumps to right place
set tabstop=2 " 2 spaces for each tab
set softtabstop=2 " Tab key results in 2 spaces
set shiftwidth=2 " size of indent, same as tabstop
set splitbelow
set splitright
set visualbell " Use visual bell instead of audible bell
set noerrorbells " Disable error bells
set noshowmode " show current mode
set scrolloff=5 " extra space from edges while scrolling
set autoread " Automatically read changed files from disk
au FocusGained,BufEnter * :checktime " Also reload when we switch buffers
set report=0 " Show all changes
set showtabline=2 " Always show tab bar
set undofile " Persistent Undo
set undodir=~/.vim/undo " store all the persisted files in a single directory
set title " show file name in window
set shortmess=atI " no intro message
set mouse=a " enable mouse in all modes
set bs=2
set laststatus=2 " always show status bar
set history=100 " Increase history from 20 default to 100
set hidden
set textwidth=80
" set esckeys " cursor keys in insert mode
set backspace=indent,eol,start " backspace in insert mode
set nobackup " all backups off
set nowb
set noswapfile " no swap files
set nostartofline " don't jump start of lines
set ruler " Show the cursor position
set switchbuf=usetab,newtab " quickfix opens buffer in existing tabs
" -------------
" ------------- Searching
" -------------
set gdefault " Add the g flag to search/replace by default
set hlsearch " hightlight results
set incsearch " Highlight dynamically as pattern is typed
set ignorecase
set showmatch
set smartcase
" -------------
" ------------- Heavy lifting stuff
" -------------
set updatetime=750 " more frequent updates -- disable for better perf
set regexpengine=1 " use the old engine for better perf
" set lazyredraw " redraw -- disable for better perf
set relativenumber " relatives numbers -- disable for better perf
set number " line numbers
set nocursorline " don't highlight current line -- use iTerm for better perf
set colorcolumn=80 " aditional column width -- disable for better perf
"set showcmd " show command while typing -- disable if slow due to spam
" set synmaxcol=100 " disable to fix some perf issues with large files
" -------------
" ------------- Theme and look
" -------------
syntax on
filetype plugin on
set background=dark
colorscheme gruvbox " heavy lifting -- disable for better perf


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~~~~~ Plugins configuration ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:ft_improved_ignorecase = 1 " make f in-casesensitive
let g:AutoPairsShortcutToggle = '' " disable alt-p by autopairs
let g:vimfiler_as_default_explorer=1 " make vimfiler as default
let g:bufExplorerShowRelativePath=1 " shows shorter path
let g:bufExplorerSortBy='fullpath' " sort by path
let g:tmuxline_powerline_separators = 0
let g:neomake_css_enabled_makers = ['stylelint'] " stylelint
let g:airline_left_sep='' " no extra characters
let g:airline_right_sep=''
let g:airline_theme='powerlineish' " airline simple theme
let g:airline_extensions = ['branch', 'tabline', 'ctrlp', 'hunks']
let g:airline#extensions#tabline#enabled = 1 " enable tabline
let g:airline#extensions#tabline#show_tab_nr = 0 " no tab number
let g:airline#extensions#tabline#buffer_nr_show = 1 " show buffer number
let g:airline#extensions#tabline#show_splits = 0 " disable split count
let g:airline#extensions#tabline#fnamemod = ':p:t' " no directories in anem
let g:airline#extensions#tabline#fnamecollapse = 1 " collapse directories
let g:airline#extensions#tabline#formatter = 'unique_tail_improved' " tab names
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]' " don't need this
let g:airline_section_x = '' " no need for file-type
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tmuxline#enabled = 1 " tmux fix
let g:airline#extensions#bufferline#enabled = 1 " show buffers
let g:airline#extensions#ale#enabled = 1
let g:vimtex_motion_matchparen = 0
let g:airline_powerline_fonts = 0 " disable for better perf
let g:SexyScroller_EasingStyle = 5 " linear no easing
let g:SexyScroller_ScrollTime = 40 " enough to see
let g:SexyScroller_CursorTime = 5 " better compared to previous
let g:comfortable_motion_no_default_key_mappings = 1 " disable default mapping
let g:ctrlp_clear_cache_on_exit = 0 " Do not clear filenames cache
let g:ctrlp_map = '' " disable default ctrl-p mapping
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1 " pipe cursor in insert mode
let g:deoplete_import_js#bin = 'importjs'
let g:deoplete#enable_at_startup = 1 " start deoplete
let g:neosnippet#snippets_directory = '~/.config/nvim/plugged/vim-snippets/snippets' " extra snippets
let g:deoplete#sources#ternjs#timeout = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#sources = {}
let g:deoplete#sources.javascript = ['buffer', 'tern']
let g:tern#filetypes = [
      \ 'js',
      \ 'jsx',
      \ 'javascript.jsx',
      \ 'ts',
      \ 'vue'
      \ ]
let g:deoplete#sources#ternjs#tern_bin = '/usr/local/bin/tern'
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.jsx,*.php"
let g:multi_cursor_use_default_mapping=0 " disable default vim-multiple-cursors mappings
let g:multi_cursor_next_key='<C-d>' " multi select with control-d like sublime
let g:multi_cursor_prev_key='<C-p>' " deselect last one
let g:multi_cursor_quit_key='<Esc>' " clear selection
" let g:user_emmet_leader_key='<C-r>' " run emmet
let g:user_emmet_mode='a' " enable emmet in all modes
let g:goyo_width=120 " distraction free mode at 120 width
let g:indent_guides_enable_on_vim_startup = 1 " enable indent guide
let g:indent_guides_guide_size = 1 " thin indent guides
let g:tmux_navigator_no_mappings = 1 " disable default tmuxnavigator mappings
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck'] " fix syntastic and vim-go perf
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_highlight_functions = 1 " Go syntax highlighting
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 0
let g:go_highlight_operators = 0
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_fmt_command = "goimports" " automatically insert import paths
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "gofmt"
let g:go_list_type = "quickfix"
let g:go_jump_to_error = 0
let g:go_def_mapping_enabled = 0 " disable control-t
let g:go_doc_keywordprg_enabled = 0
let g:go_auto_type_info = 0
let g:go_fmt_autosave = 1
let g:go_auto_sameids = 1
let g:go_snippet_engine = "neosnippet"
let g:go_list_height = 10
" tagbar config for Go
let g:tagbar_type_go = {
\ 'ctagstype' : 'go',
\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
\ ],
\ 'sro' : '.',
\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
\ },
\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
\ },
\ 'ctagsbin'  : 'gotags',
\ 'ctagsargs' : '-sort -silent'
\ }
" NERDTree General properties
let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.o$', '\.pyc$', '\.php\~$']
let NERDTreeWinSize = 35
let g:NERDTreeShowHidden=1 " show dotfiles by default
let NERDTreeRespectWildIgnore=1 " respect wildignore
let loaded_netrwPlugin=1 " disable netrw since we're going to hijack it with NERDTree anyway
let g:NERDTreeHijackNetrw = 1 " use the split explorer model, hijack netrw
let g:NERDTreeMinimalUI=1 " Hide 'Press ? for help' prompt
let g:nerdtree_sync_cursorline=1 " Enable syncing of active file to nerdtree
" NERDTree Make sure that when NT root is changed, Vim's pwd is also updated
let NERDTreeChDirMode = 2
let NERDTreeShowLineNumbers = 1
let NERDTreeAutoCenter = 1
" NERDTreeTabs
let nerdtree_tabs_focus_on_files = 1
let nerdtree_tabs_autofind = 1
" auto build to find errors on save
autocmd BufWritePre *.go silent! :GoBuild!
" tmuxline look and feel
let g:tmuxline_preset = {
\'a'    : '  #S  ',
\'b'    : '',
\'c'    : '',
\'win'  : ' #I-#W ',
\'cwin' : ' #I-#W ',
\'x'    : '#(whoami)',
\'y'    : '#[fg=green]#(rainbarf --nobattery --width 25 --rgb --no-bright)#[default]',
\'z'    : '#H'}
" specific linters while typing, disable linting for go
" options including standard, eslint, flow
let g:ale_linters = {
\   'javascript': ['eslint', 'prettier', 'importjs', 'tsserver', 'typecheck'],
\   'typescript': ['eslint', 'prettier', 'tsserver', 'typecheck'],
\   'go': [],
\}
let g:ale_sign_column_always = 1
let g:ale_sign_error = '💩'
let g:ale_sign_warning = '⚠️'
let g:ale_javascript_eslint_suppress_missing_config = 0
let g:ale_javascript_eslint_suppress_eslintignore = 1
let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_prettier_use_global = 1
" enable formatter for js and jsx file using prettier
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['markdown'] = ['prettier']
" let g:ale_fixers['json'] = ['prettier']
let g:ale_fix_on_save = 0
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
let g:ale_javascript_prettier_use_local_config = 1
command! FIXDisable let ale_fix_on_save=0
command! FIXEnable let ale_fix_on_save=1
" if user calls these options manually, local configuration will be replaced
" so use these options only if you don't have local config in package.json or
" .prettierrc defined.
command! FIXOptionSemi let ale_javascript_prettier_options='--single-quote --trailing-comma es5'
command! FIXOptionNosemi let ale_javascript_prettier_options='--single-quote --trailing-comma --no-semi es5'
command! FIXOptionNosemiTrailing let ale_javascript_prettier_options='--single-quote --no-semi es5'
command! FIXOptionJSON let g:ale_fixers['json'] = ['prettier']


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~~~~~ Searching and selecting files ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" --- leader+ff --- AG and ACK
nnoremap <leader>ff :Ack 
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" --- control+v --- selecting and navigating through snippets
imap <C-v> <Plug>(neosnippet_expand_or_jump)
smap <C-v> <Plug>(neosnippet_expand_or_jump)
xmap <C-v> <Plug>(neosnippet_expand_target)
" --- control-g --- search files in CURRENT BUFFER directory using 'fzf'
nnoremap <C-g> :cd %:h<cr>:FZF<cr>
" --- control-f --- search with Ag
nnoremap <C-f> :Ag<cr>
" --- gt --- search git commits
nnoremap gt :Commits<cr>
" --- control-t --- search all files in PROJECT directory using 'fzf'
nnoremap <C-t> :FZF<cr>
" --- control-p --- search all commands
nnoremap <C-p> :Commands<cr>
" --- alt-p --- run a command in current directory using Vim
nnoremap <a-p> :cd %:h<cr>:! 
" --- leader-p --- run a command using tmux
" --- iTerm hexcodes: '0x2C 0x70' --- Command-P
nnoremap <leader>p :call VimuxRunCommand("")<left><left>
" --- leader-r --- run the last command again using tmux
" --- iTerm hexcodes: '0x2C 0x72' --- Command-R
nnoremap <leader>r :call VimuxRunLastCommand()<cr>
" --- esc --- search clear on pressing escape by default
nnoremap <silent> <esc> :noh<CR>
" --- control-n --- create a new file in current buffer directory
nnoremap <C-n> :tabe %:h/
" --- leader-j, leader-jj --- JS: jump to definition file in split or tab
au FileType javascript nmap <leader>j <ESC>:TernDefSplit<CR>
au FileType javascript nmap <leader>jj <ESC>:TernDefTab<CR>
" --- leader-i --- Go: show type
au FileType go nmap <leader>i <Plug>(go-info)
" --- leader-j --- Go: jump to def in new split
au FileType go nmap <leader>j <Plug>(go-def-vertical)
" --- leader-t --- Go: jump to def in new tab
au FileType go nmap <leader>jj <Plug>(go-def-tab)
" --- leader-d --- Go: jump to godoc in new split
au FileType go nmap <leader>d <Plug>(go-doc-vertical)
" --- leader-r --- Go: run in new tab
au FileType go nmap <leader>r <Plug>(go-run-tab)
" --- leader-b --- Go: build
au FileType go nmap <leader>b :GoBuild!<CR>
" --- leader-t --- Go: test
au FileType go nmap <leader>t <Plug>(go-test)
" --- leader-c --- Go: show coverage
au FileType go nmap <leader>c <Plug>(go-coverage)
" --- leader-e --- Go: check errors
au FileType go nmap <leader>c :GoErrCheck<cr>
" --- leader-z --- open tagbar
nnoremap <leader>z :TagbarToggle<CR>
au FileType go nnoremap <leader>f :GoDeclsDir<CR>
" --- leader-; --- quickly navigate to necessary buffer
" --- iTerm hexcodes: '0x2C 0x3B' --- Command-;
map <leader>; :call ToggleBuf()<cr>
vmap <leader>; <esc>:call ToggleBuf()<cr>
" --- leader-m --- previous in quickfix list
" --- iTerm hexcodes: '0x2C 0x6D' --- Command-M
au FileType go map <leader>m :cprevious<CR>
au FileType javascript map <leader>m <Plug>(ale_previous_wrap)
" --- leader-n --- next in quickfix list
" --- iTerm hexcodes: '0x2C 0x6E' --- Command-N
au FileType go map <leader>n :cnext<CR>
au FileType javascript map <leader>n <Plug>(ale_next_wrap)
" --- leader-q --- toggle quickfix list
" --- iTerm hexcodes: '0x2C 0x71' --- Command-B
nmap <script> <silent> <leader>q :call ToggleQuickfixList()<CR>
" --- leader-q --- toggle quickfix list
" --- iTerm hexcodes: '0x2C 0x76' --- Control-Space
map <leader>v :Dash<CR>


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~~~~~ Movement and navigation ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" --- leader,# --- switch to buffnumber
nnoremap <expr> <Leader>1 Key_leader_bufnum(1)
nnoremap <expr> <Leader>2 Key_leader_bufnum(2)
nnoremap <expr> <Leader>3 Key_leader_bufnum(3)
nnoremap <expr> <Leader>4 Key_leader_bufnum(4)
nnoremap <expr> <Leader>5 Key_leader_bufnum(5)
nnoremap <expr> <Leader>6 Key_leader_bufnum(6)
nnoremap <expr> <Leader>7 Key_leader_bufnum(7)
nnoremap <expr> <Leader>8 Key_leader_bufnum(8)
nnoremap <expr> <Leader>9 Key_leader_bufnum(9)
" --- alt-l, alt-h --- relocate tab right and left with alt-i and alt-o
nnoremap <a-l> :tabm +1<CR>
nnoremap <a-h> :tabm -1<CR>
inoremap <a-l> <ESC>:tabm +1<CR>
inoremap <a-h> <ESC>:tabm -1<CR>
" --- space --- mark with space instead of m, for vim-easyclip
nnoremap <space> m
" --- leader-sj, leader-sk --- jump up or down half screen
" --- iTerm hexcodes: '0x2C 0x6A' --- Command-J
" --- iTerm hexcodes: '0x2C 0x6B' --- Command-K
nnoremap <silent> <leader>sj <C-d>
nnoremap <silent> <leader>sk <C-u>
inoremap <silent> <leader>sj <Esc><C-d>
inoremap <silent> <leader>sk <Esc><C-u>
" --- control-e --- nerdtree control+e
nnoremap <silent> <C-e> :call ToggleNerdFocus()<CR>
inoremap <silent> <C-e> <ESC>:call ToggleNerdFocus()<CR>
noremap <silent> <Leader>e :NERDTreeTabsToggle<CR>
" --- gi, go --- change tabs
nnoremap go :tabn<CR>
nnoremap gi :tabp<CR>
" --- control-i, control-o --- next prev buffers
nnoremap <C-o> :call NextBuffer()<cr>
nnoremap <C-i> :call PrevBuffer()<CR>
inoremap <C-o> <ESC>:call NextBuffer()<CR>
inoremap <C-i> <ESC>:call PrevBuffer()<CR>
" --- gp --- fuzzy serach buffers
nnoremap gp :Buffers<CR>
" --- <leader>-a --- easier buffer switch
" --- iTerm hexcodes: '0x2C 0x61' --- Cmd-A
nnoremap <leader>a <c-^>
" --- control-u --- close tab or pane
nmap <C-u> :bp<bar>sp<bar>bn<bar>bd<CR>
" --- gu --- close tab or pane
nmap gu :q<CR>
" --- control-h, control-j, control-k, control-l --- Jump to panes
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
inoremap <C-h> <Esc><C-w>h
inoremap <C-l> <Esc><C-w>l
inoremap <C-j> <Esc><C-w>j
inoremap <C-k> <Esc><C-w>k
" --- control-h, control-j, control-k, control-l --- tmux navigation
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
inoremap <silent> <C-k> <esc>:TmuxNavigateUp<cr>
inoremap <silent> <C-j> <esc>:TmuxNavigateDown<cr>
inoremap <silent> <C-l> <esc>:TmuxNavigateRight<cr>
inoremap <silent> <C-h> <esc>:TmuxNavigateLeft<cr>
" --- =, - --- Resizing panes
nnoremap = <C-w>>
nnoremap - <C-w><


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~~~~~ Editing ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" --- command-s --- run ALEFix
nmap <leader>ss :ALEFix<cr>
" --- >, < --- don't lose selection after indenting
vnoremap > >gv
vnoremap < <gv
" --- shift-k --- add new lines top
nnoremap <s-k> m`O<ESC>``
" --- shift-f --- add new lines below, don't lose cursor position or change mode
nnoremap <s-j> m`o<ESC>``
" --- alt+; --- add semicolons at the end of line even in insert mode
inoremap <a-;> <Esc>m`A;<Esc>``i
nnoremap <a-;> m`A;<Esc>``
" --- alt+, --- add comma at the end of line even in insert mode
inoremap <a-,> <Esc>m`A,<Esc>``i
nnoremap <a-,> m`A,<Esc>``
" --- Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gp :Gpush<CR>
noremap <Leader>gg :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~~~~~ Buffers and sessions ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" --- ,-f --- toggle distraction free mode
" --- iTerm hexcodes: '0x2C 0x66' --- Command-F
nnoremap <Leader>f :Goyo<cr>
" --- control+s --- save this buffer
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a
" --- alt+s --- save all buffers
nmap <a-s> :wa<CR>
imap <a-s> <Esc>:wa<CR>a
" --- alt-q --- save all buffers, save session based on directory and quit
nmap <a-q> :wqa!<CR>
imap <a-q> <Esc>:wqa!<CR>
" --- alt-w --- save special session and all buffers
nmap <a-w> :mksession! ~/vim_session <cr>:wqa!<CR>
imap <a-w> <esc>:mksession! ~/vim_session <cr>:wqa!<CR>
" --- alt-r --- restore special session
map <a-r> :source ~/vim_session <cr>
" --- automatic --- save and restore session based on current directory.
" we need to use :qa! to quit all buffers at once otherwise only the last one
" is saved. Also we use FindRootDirectory() utility from airblade/vim-rooter
" plugin so we always have the correct pwd, using native pwd is buggy sometimes.
fu! SaveSess()
  NERDTreeTabsClose
  execute 'mksession! ' . getcwd() . '/.session.vim'
endfunction
fu! RestoreSess()
  if filereadable(getcwd() . '/.session.vim')
    execute 'so ' . getcwd() . '/.session.vim'
    if bufexists(1)
      for l in range(1, bufnr('$'))
        if bufwinnr(l) == -1
          exec 'sbuffer ' . l
        endif
      endfor
    endif
  endif
  syntax on
  execute 'bd ' . getcwd()
endfunction
" --- We use automatic sessions for neovim only
if has('nvim')
  " Save session on quitting Vim
  autocmd VimLeave * call SaveSess()
  " Restore session on starting Vim
  autocmd VimEnter * nested call RestoreSess()
endif


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~~~~~ Misc ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" --- alt-e --- reload vim
noremap <a-e> <Esc>:source ~/.vimrc.js/vimrc<cr>
" --- ,w --- remove trailing spaces manualy if there's any
nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>
" allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! :w !sudo tee %
" fix c-h bug
if has('nvim')
  nmap <bs> :<c-u>TmuxNavigateLeft<cr>
endif
" move outside nerdtree first then switch buffer or list buffers
fu! NextBuffer()
  if bufname("") == "NERD_tree_2"
    wincmd p
  endif
  bn
endfunction
fu! PrevBuffer()
  if bufname("") == "NERD_tree_2"
    wincmd p
  endif
  bp
endfunction
fu! ToggleBuf()
  if bufname("") == "NERD_tree_2"
    wincmd p
  endif
  ToggleBufExplorer
endfunction
" opens nerdtree if it's not open already, then switches between file and
" nerdtree split
fu! ToggleNerdFocus()
  if bufwinnr("NERD_tree_2") == 1
    if bufname("") == "NERD_tree_2"
      wincmd p
    else
      NERDTreeTabsFind
    endif
  else
    NERDTreeTabsToggle
  endif
endfunction
fu! CloseAllOtherBuffers()
  %bd|e#
endfunction
" makes gf open nodejs imports
set path=.,src
set suffixesadd=.js,.jsx
function! LoadMainNodeModule(fname)
    let nodeModules = "./node_modules/"
    let packageJsonPath = nodeModules . a:fname . "/package.json"
    if filereadable(packageJsonPath)
        return nodeModules . a:fname . "/" . json_decode(join(readfile(packageJsonPath))).main
    else
        return nodeModules . a:fname
    endif
endfunction
set includeexpr=LoadMainNodeModule(v:fname)
" quickly switch between buffers by their number
func! Key_leader_bufnum(num)
  let l:buffers = Buflisted()
  let l:input = a:num . ""

  while 1

    let l:cnt = 0
    let l:i=0
    " count matches
    while l:i<len(l:buffers)
      let l:bn = l:buffers[l:i] . ""
      if l:input==l:bn[0:len(l:input)-1]
        let l:cnt+=1
      endif
      let l:i+=1
    endwhile

    " no matches
    if l:cnt==0 && len(l:input)>0
      echo "no buffer [" . l:input . "]"
      return ''
    elseif l:cnt==1
      return ":b " . l:input . "\<CR>"
    endif

    echo ":b " . l:input

    let l:n = getchar()

    if l:n==char2nr("\<BS>") ||  l:n==char2nr("\<C-h>")
      " delete one word
      if len(l:input)>=2
        let l:input = l:input[0:len(l:input)-2]
      else
        let l:input = ""
      endif
    elseif l:n==char2nr("\<CR>") || (l:n<char2nr('0') || l:n>char2nr('9'))
      return ":b " . l:input . "\<CR>"
    else
      let l:input = l:input . nr2char(l:n)
    endif

    let g:n = l:n

  endwhile
endfunc
func! Buflisted()
  return filter(range(1, bufnr('$')), 'buflisted(v:val)')
endfunc
