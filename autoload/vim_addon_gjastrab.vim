fun! vim_addon_gjastrab#Activate(vam_features)
  let g:vim_addon_urweb = { 'use_vim_addon_async' : 1 }
  let g:netrw_silent = 0
  let g:linux=1
  let g:config = { 'goto-thing-handler-mapping-lhs' : 'gf' }

  let g:local_vimrc = {'names':['vl_project.vim']}

  let plugins = {
        \ 'always' : ['vim-addon-commenting', 'vim-addon-async', 'vim-addon-git', 'vim-addon-toggle-buffer', 'snipmate-snippets', 'vim-addon-goto-thing-at-cursor', 'Command-T', 'bufexplorer.zip', 'taglist'],
        \ 'normal' : ['surround', 'Solarized', 'The_NERD_tree'],
        \ 'ruby' : ['rails', 'tabular', 'haml.zip', 'cucumber.zip']
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
endf
