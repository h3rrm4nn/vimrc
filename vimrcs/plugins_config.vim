"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important:
"       This requries that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" => Load pathogen paths
""""""""""""""""""""""""""""""
call pathogen#infect(join([g:vimrcpath, '/modules/{}'], ''))
call pathogen#infect(join([g:vimrcpath, '/sources/{}'], ''))
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
    let g:yankring_history_dir = join([g:vimrcpath, '/temp_dirs/'], '')
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
let g:clang_library_path='/usr/lib/llvm-6.0/lib/libclang.so.1'
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
" => Vim-hdl
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configure the project file
" This plugin is not working, I assume it is related to the python version
" let g:vimhdl_conf_file = '~/Simulation/fsd.hardware/test.prj'
" Tell Syntastic to use vim-hdl
" let g:syntastic_vhdl_checkers = ['vimhdl']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-Latex
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd Filetype tex setlocal nofoldenable
autocmd FileType tex setlocal textwidth=80

let g:vimtex_view_method = 'mupdf'
let g:vimtex_compiler_latexmk = {'callback' : 0} 
let g:tex_conceal = ""
" set the textwidth for latex files
