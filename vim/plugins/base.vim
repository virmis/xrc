" Base vim plugins
call dein#add("Shougo/defx.nvim")
call dein#add("Shougo/vimshell.vim")
call dein#add("Shougo/deoplete.nvim")
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif
call dein#add("Shougo/vimproc.vim", {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ })
call dein#add("tpope/vim-abolish")
call dein#add("tpope/vim-endwise.git")
call dein#add("tpope/vim-ragtag")
call dein#add("tpope/vim-repeat.git")
call dein#add("tpope/vim-surround.git")
call dein#add("tpope/vim-unimpaired")
call dein#add("xolox/vim-misc")
call dein#add("xolox/vim-session")
call dein#add("vimplugin/project.vim")
