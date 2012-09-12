Just my vim config
==================

Install
-------

    git clone git://github.com/popravich/vim.git ~/.vim

to enable add following lines to `~/.vimrc`:

    if filereadable($HOME . "/.vim/vimrc")
       source $HOME/.vim/vimrc
    endif
