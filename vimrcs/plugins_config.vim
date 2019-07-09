"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important: 
"       This requries that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" => Load pathogen paths
""""""""""""""""""""""""""""""
call pathogen#infect('~/.vim_runtime/sources_forked/{}')
call pathogen#infect('~/.vim_runtime/sources_non_forked/{}')
call pathogen#helptags()

""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>

""""""""""""""""""""""""""""""
" => fugitive plugin
""""""""""""""""""""""""""""""
set diffopt+=vertical

""""""""""""""""""""""""""""""
" => ctags plugin
""""""""""""""""""""""""""""""
set tags=tags;/

""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>


""""""""""""""""""""""""""""""
" => YankRing
""""""""""""""""""""""""""""""
if has("win16") || has("win32")
    " Don't do anything
else
    let g:yankring_history_dir = '~/.vim_runtime/temp_dirs/'
endif


""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_working_path_mode = 'ra' " set working path to first occurence of .git .svn etc.

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'


""""""""""""""""""""""""""""""
" => snipMate (beside <TAB> support <CTRL-j>)
""""""""""""""""""""""""""""""
ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>
snor <c-j> <esc>i<right><c-r>=snipMate#TriggerSnippet()<cr>


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_next_key="\<C-s>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext http://amix.dk/blog/post/19678
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-airline config (force color)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:airline_theme="luna"
let g:airline_theme='bubblegum'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_python_checkers=['pyflakes']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => clang_complete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:clang_library_path='/usr/lib/x86_64-linux-gnu'
let g:clang_complete_auto = 1
" set conceallevel=2
" set concealcursor=vin
let g:clang_snippets=1
let g:clang_conceal_snippets=1
let g:clang_snippets_engine='clang_complete'

" Complete options (disable preview scratch window, longest removed to aways show menu)
set completeopt=menu,menuone

" Limit popup menu height
set pumheight=20

" SuperTab completion fall-back 
let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => AutoComplPop
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:acp_behaviorKeywordLength = 3


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Solarized
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:solarized_termcolors=256
" syntax enable
" set background=dark
" colorscheme solarized
let g:solarized_termtrans=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-hdl
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configure the project file
" This shitty plugin is not working, I assume it is related to the python version
" let g:vimhdl_conf_file = '~/Simulation/fsd.hardware/test.prj'
" Tell Syntastic to use vim-hdl
" let g:syntastic_vhdl_checkers = ['vimhdl']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-Latex
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd Filetype tex setlocal nofoldenable

let g:vimtex_view_method = 'mupdf'
let g:vimtex_compiler_latexmk = {'callback' : 0} 
let g:tex_conceal = ""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:spotify_token='ZTMzNDFmMWM1OGNkNGYyNzkwODkzNGIzOTA4NzQ2NTE6MWY0YzU1ZTRkZWI2NGM5NTk4YWJhZDEwYzdmYWVmZDQ='




" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Vim-Latex
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
" filetype plugin on

" " set the textwidth for latex files
" autocmd FileType tex setlocal textwidth=80

" " IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" " can be called correctly.
" "set shellslash

" " IMPORTANT: grep will sometimes skip displaying the file name if you
" " search in a singe file. This will confuse Latex-Suite. Set your grep
" " program to always generate a file-name.
" set grepprg=grep\ -nH\ $*

" " OPTIONAL: This enables automatic indentation as you type.
" filetype indent on

" " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" " The following changes the default filetype back to 'tex':
" let g:tex_flavor='latex'

" autocmd Filetype tex setlocal nofoldenable
" let g:Tex_DefaultTargetFormat='pdf'

" " Taglist modification required for ctags and VHDL
" let g:tlist_vhdl_settings   = 'vhdl;d:package declarations;b:package bodies;e:entities;a:architecture specifications;t:type declarations;p:processes;f:functions;m:port maps;r:procedures'
