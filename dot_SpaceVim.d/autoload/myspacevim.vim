function! myspacevim#before() abort
  set ignorecase
  set smartcase
  set clipboard=unnamedplus
  set nohls
  nnoremap <expr> j v:count ? 'j' : 'gj'
  nnoremap <expr> k v:count ? 'k' : 'gk'
  autocmd FileType *tex setlocal wrap spell spl=de,en
  let g:neomake_tex_enabled_makers = []
  " let g:neomake_tex_enabled_makers = ['chktex']
  au BufRead * let g:indentLine_setConceal = 0
endfunction

function! myspacevim#after() abort
endfunction
