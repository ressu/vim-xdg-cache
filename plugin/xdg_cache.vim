" xdg_cache.vim - Utility to set XDG paths on vim load
" Author:         Sami Haahtinen <ressu@ressukka.net>
" Description:    Simple utility to store all of your runtime files in XDG cache

if exists('g:loaded_xdg_cache')
  finish
endif

if empty($XDG_CACHE_HOME)
  " set XDG_CACHE_HOME to the default value
  let $XDG_CACHE_HOME=expand('$HOME/.cache')
endif

let s:vim_cache=fnamemodify(expand('$XDG_CACHE_HOME/vim'), ':p')

function! s:set_and_create(dest_var, dest_dir)
  if !get(g:, "vim_xdg_cache_" . a:dest_var . "_disabled", 0)
    let l:fullpath=s:vim_cache . a:dest_dir
    if !isdirectory(l:fullpath)
      call mkdir(l:fullpath, "p")
    endif
    execute 'let &' . a:dest_var . '=l:fullpath . ''//'''
  endif
endfunction

call s:set_and_create('directory', 'swap')
call s:set_and_create('undodir', 'undo')
call s:set_and_create('backupdir', 'backup')

unlet s:vim_cache

let g:loaded_xdg_cache = 1
