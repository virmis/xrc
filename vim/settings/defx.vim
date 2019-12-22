" Defx explorer
nnoremap <silent><C-\> :<C-u>Defx -no-toggle -auto-cd<CR>

set splitright
set splitbelow

function! s:defx_toggle_tree() abort
	" Open current file, or toggle directory expand/collapse
	if defx#is_directory()
		return defx#do_action('open_or_close_tree')
	endif
	return defx#do_action('multi', ['drop', 'quit'])
endfunction

call defx#custom#option('_', {
  \ 'winwidth': 30,
  \ 'split': 'vertical',
  \ 'direction': 'topleft',
  \ 'show_ignored_files': 0,
  \ 'ignored_files':
	\     '.mypy_cache,.pytest_cache,.git,.hg,.svn,.stversions'
	\   . ',__pycache__,.sass-cache,*.egg-info,.DS_Store,*.pyc'
  \ })

call defx#custom#column('icon', {
  \ 'directory_icon': '▸',
	\ 'opened_icon': '▾',
	\ 'root_icon': ' ',
	\ })

" Internal use
let s:original_width = get(get(defx#custom#_get().option, '_'), 'winwidth')

augroup user_plugin_defx
  autocmd!

  " Delete defx if it's the only buffer left in the window
  autocmd WinEnter * if &filetype == 'defx' && winnr('$') == 1 | bdel | endif

  " Move focus to the next window if current buffer is defx
  autocmd TabLeave * if &filetype == 'defx' | wincmd w | endif

  " Define defx window mappings
	autocmd FileType defx call <SID>defx_mappings()

augroup END

function! s:defx_mappings() abort
  setlocal signcolumn=no expandtab

  nnoremap <silent><buffer><expr> <CR>  <SID>defx_toggle_tree()
  nnoremap <silent><buffer><expr> h
    \ defx#do_action('close_tree')
  nnoremap <silent><buffer><expr> t
    \ defx#do_action('open_tree_recursive')
  nnoremap <silent><buffer><expr> st
    \ defx#do_action('multi', [['drop', 'tabnew'], 'quit'])
  nnoremap <silent><buffer><expr> sv
    \ defx#do_action('multi', [['drop', 'vsplit'], 'quit'])
  nnoremap <silent><buffer><expr> sh
    \ defx#do_action('multi', [['drop', 'split'], 'quit'])
  nnoremap <silent><buffer><expr> y
    \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> x
    \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> .
    \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> v
	  \ defx#do_action('open', 'vsplit')

  " buffer management
  nnoremap <silent><buffer><expr> q
    \ defx#do_action('quit')

  " file/dir management
  nnoremap <silent><buffer><expr><nowait> c
    \ defx#do_action('copy')
	nnoremap <silent><buffer><expr><nowait> m
    \ defx#do_action('move')
	nnoremap <silent><buffer><expr><nowait> p
    \ defx#do_action('paste')
	nnoremap <silent><buffer><expr><nowait> r
    \ defx#do_action('rename')
  nnoremap <silent><buffer><expr><nowait> d
    \ defx#do_action('remove')
  nnoremap <silent><buffer><expr><nowait> n
    \ defx#do_action('new_file')

  " change directory
  nnoremap <silent><buffer><expr> ~
    \ defx#async_action('cd')
  nnoremap <silent><buffer><expr> u
    \ defx#do_action('cd', ['..'])

endfunction
