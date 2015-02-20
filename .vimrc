" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.
  
" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim
 
" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible
 
" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on
 
" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

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

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd            " Show (partial) command in status line.
"set showmatch          " Show matching brackets.
"set ignorecase         " Do case insensitive matching
"set smartcase          " Do smart case matching
"set incsearch          " Incremental search
"set autowrite          " Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a            " Enable mouse usage (all modes) in terminals

" Source a global configuration file if available
" XXX Deprecated, please move your changes here in /etc/vim/vimrc
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


" Configuration
"
" tab in 4 space
set ts=4

map b :tabnew "Новая вкладка"

map w :tabclose "Закрыть вкладку

map h :tabprevious "Предыдущая вкладка"

map l :tabnext "Следующая вкладка"

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


set sidescroll=5

set listchars+=precedes:<,extends:>

set showmatch " проверка скобок

set noswapfile

"highlight Comment ctermfg=darkgrey



" binds
"
"
nmap <F2> :set paste<CR>
nmap <F10> :q!<CR>

imap {<CR> {<CR>}<Esc>O<Tab>

nmap <Home> ^
imap <Home> <Esc>I

" выход
  imap <F12> <Esc>:qa<CR>
  nmap <F12> :qa<CR>

" сохранение текущего буфера
 imap <F2> <Esc>:w<CR>a
 nmap <F2> :w<CR>

 " сохранение всех буферов
  imap <S-F2> <Esc>:wa<CR>a
  nmap <S-F2> :wa<CR>

  " список буферов
  imap <S-F4> <Esc>:buffers<CR>
  nmap <S-F4> :buffers<CR>

  " сборка с сохранением
  imap <F9> <Esc>:wa<CR>:make<CR>
  nmap <F9> :wa<CR>:make<CR>



  " пересборка с сохранением
  imap <C-F9> <Esc>:wa<CR>:make<Space>clean<CR>:make<CR>
  nmap <C-F9> :wa<CR>:make<Space>clean<CR>:make<CR>


  " открыть окно результатов компиляции
  imap <S-F9> <Esc>:copen<CR>
  nmap <S-F9> :copen<CR>

  " вкл/выкл отображения номеров строк
  imap <F1> <Esc>:set<Space>nu!<CR>a
  nmap <F1> :set<Space>nu!<CR>


  " следующая ошибка
  imap <C-F10> <Esc>:cn<CR>i
  nmap <C-F10> :cn<CR>

   " предыдущая ошибка
  imap <S-F10> <Esc>:cp<CR>i
  nmap <S-F10> :cp<CR>

  " вкл/выкл отображения найденных соответствий
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
