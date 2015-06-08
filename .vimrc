
syntax on
 
" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
"    \| exe "normal g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules according to the
" detected filetype. Per default Debian Vim only load filetype specific
" plugins.
"if has("autocmd")
"  filetype indent on
"endif

" Source a global configuration file if available
" XXX Deprecated, please move your changes here in /etc/vim/vimrc
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


" Configuration
"
" tab in 4 space
set ts=4

map b :tabnew "New tab"

map w :tabclose "Close tab"

map h :tabprevious "Previous tab"

map l :tabnext "Next tab"

map <F3> :set paste<CR>

set wildmenu
set wcm=<Tab>
menu Encoding.koi8-r       :e ++enc=koi8-r<CR>
menu Encoding.windows-1251 :e ++enc=cp1251<CR>
menu Encoding.ibm-866      :e ++enc=ibm866<CR>
menu Encoding.utf-8        :e ++enc=utf-8 <CR>
map <F8> :emenu Encoding.<TAB>
set background=dark

set ignorecase
set hlsearch
set incsearch

" Show matching brackets.
set showmatch 

set sidescroll=5

set listchars+=precedes:<,extends:>

set showmatch " проверка скобок

set noswapfile

"highlight Comment ctermfg=darkgrey


" my binds
"
"
nmap <F2> :set paste<CR>
nmap <F10> :q!<CR>

imap {<CR> {<CR>}<Esc>O<Tab>

nmap <Home> ^
imap <Home> <Esc>I

" exit 
  imap <F12> <Esc>:qa<CR>
  nmap <F12> :qa<CR>

  " show/hide string numbers
  imap <F1> <Esc>:set<Space>nu!<CR>a
  nmap <F1> :set<Space>nu!<CR>

  " show/hide matches
  imap <F4> <Esc>:set<Space>hls!<CR>a
  nmap <F4> :set<Space>hls!<CR>

  " mouse scroll
  "set mouse=a

  " toggle between terminal and vim mouse
	map <silent><F5> :let &mouse=(&mouse == "a"?"":"a")<CR>:call ShowMouseMode()<CR>
	imap <silent><F5> :let &mouse=(&mouse == "a"?"":"a")<CR>:call ShowMouseMode()<CR>
	function ShowMouseMode()
    		if (&mouse == 'a')
        	   echo "mouse-vim"
    		else
        	   echo "mouse-xterm"
    		endif
	endfunction	

autocmd BufReadPost * 
  \ if line("'\"") > 0 && line("'\"") <= line("$") | 
  \   exe "normal g'\"" | 
  \ endif

" Auto-save a file when you leave insert mode
autocmd InsertLeave * if expand('%') != '' | update | endif

" Yaml
au BufNewFile,BufRead *.yaml,*.yml,parameter-map.conf so ~/.vim/yaml.vim
