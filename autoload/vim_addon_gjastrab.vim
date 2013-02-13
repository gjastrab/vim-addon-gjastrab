fun! vim_addon_gjastrab#Activate(vam_features)
  let g:vim_addon_urweb = { 'use_vim_addon_async' : 1 }
  let g:netrw_silent = 0
  let g:linux=1
  let g:config = { 'goto-thing-handler-mapping-lhs' : 'gf' }

  let g:local_vimrc = {'names':['vl_project.vim']}

  let plugins = {
        \ 'always' : ['vim-addon-commenting', 'vim-addon-async', 'vim-addon-git', 'vim-addon-toggle-buffer', 'snipmate-snippets', 'vim-addon-goto-thing-at-cursor', 'Command-T', 'bufexplorer.zip', 'taglist', 'trailing-whitespace'],
        \ 'normal' : ['surround', 'Solarized', 'The_NERD_tree'],
        \ 'ruby' : ['rails', 'Tabular', 'haml.zip', 'cucumber.zip']
    \ }
  let activate = []
  for [k,v] in items(plugins)
    if k == 'always'
          \ || (type(a:vam_features) == type([]) && index(a:vam_features, k) >= 0)
          \ || (type(a:vam_features) == type('') && a:vam_features == 'all')
      call extend(activate, v)
    endif
  endfor

  call vam#ActivateAddons(activate,{'auto_install':1})

  let g:snipMate = { 'scope_aliases' :
        \ {'xhtml' : 'html'
        \ ,'html' : 'javascript'
        \ ,'mxml' : 'actionscript'
        \ ,'haml' : 'html,javascript'
        \ }}

  set background=dark
  colorscheme solarized

  " NERDtree
  let NERDTreeShowBookmarks=0
  map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

  " Tabular
  inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

  function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
      let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
      let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
      Tabularize/|/l1
      normal! 0
      call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
  endfunction

  " Command-T
  let g:CommandTMaxHeight=20
  let g:CommandTScanDotDirectories=0
  set wildmode=list:longest,list:full
  set wildignore+=*.log,*.o,*.sassc,*.png,*.jpg,*.jpeg,*.gif,*.swf,*.class,*.scssc,*.pdf,public/system/**
  map <leader>t :CommandT<CR>
  map <leader>f :CommandTFlush<CR>
endf
