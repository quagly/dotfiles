#!/usr/bin/env bash
set -e
# TODO
# 1.
# consider using a package manager
# that using vims new packaging https://github.com/kristijanhusak/vim-packager
# 2.
# add ale inline syntax checker
# https://github.com/dense-analysis/ale
# this is a async replacement for syntastic
# with this do I still need pymode check on save?
# I hope not
# 3.
# The syntax files and some plugins all seem to be the same code
# so create a function and loop them as default behavior


## START plugins

### START required plugins

# python-mode
# kitchen sink plugin for python
folder="${HOME}/.vim/pack/plugin/start/python-mode"
if [ -d $folder ]; then
  git -C $folder submodule update --init --recursive
else
  git clone --recurse-submodules https://github.com/python-mode/python-mode.git $folder
fi

# jedi-vim
# code completion for python
# isn't working right.  may look at other completions or just use
# python mode rope
folder="${HOME}/.vim/pack/plugin/start/jedi-vim"
if [ -d $folder ]; then
  git -C $folder submodule update --init --recursive
else
  git clone --recursive https://github.com/davidhalter/jedi-vim.git $folder
fi

# vim-airline
# status line
folder="${HOME}/.vim/pack/plugin/start/vim-airline"
if [ -d $folder ]; then
  git -C $folder pull
else
  git clone https://github.com/vim-airline/vim-airline.git $folder
fi

# vim-airline
# status line
folder="${HOME}/.vim/pack/plugin/start/vim-airline"
if [ -d $folder ]; then
  git -C $folder pull
else
  git clone https://github.com/vim-airline/vim-airline.git $folder
fi

folder="${HOME}/.vim/pack/plugin/start/ale"
if [ -d $folder ]; then
  git -C $folder pull
else
  git clone https://github.com/dense-analysis/ale.git $folder
fi

### END required plugins

### START optional plugins

# vim-scala
# for scala I will probably use intellij
# so making this optional
folder="${HOME}/.vim/pack/plugin/opt/vim-scala"
if [ -d $folder ]; then
  git -C $folder pull
else
  git clone https://github.com/derekwyatt/vim-scala.git $folder
fi

# vim-fireplace
# clojure repl integration
# very cool but when will I ever use clojure again?
# so making this optional
folder="${HOME}/.vim/pack/plugin/opt/vim-fireplace"
if [ -d $folder ]; then
  git -C $folder pull
else
  git clone https://github.com/tpope/vim-fireplace.git $folder
fi

### END optional plugins


## END plugins


## START syntax

# rust syntax
folder="${HOME}/.vim/pack/syntax/start/rust"
if [ -d $folder ]; then
  git -C $folder pull
else
  git clone  https://github.com/rust-lang/rust.vim.git $folder
fi

# dockerfile syntax
folder="${HOME}/.vim/pack/syntax/start/dockerfile"
if [ -d $folder ]; then
  git -C $folder pull
else
  git clone https://github.com/ekalinin/Dockerfile.vim.git $folder
fi

# json syntax
folder="${HOME}/.vim/pack/syntax/start/vim-json"
if [ -d $folder ]; then
  git -C $folder pull
else
  git clone https://github.com/elzr/vim-json.git $folder
fi

# mustache template syntax
folder="${HOME}/.vim/pack/syntax/start/vim-mustache-handlebars"
if [ -d $folder ]; then
  git -C $folder pull
else
  git clone https://github.com/mustache/vim-mustache-handlebars.git $folder
fi

# protobuf syntax
folder="${HOME}/.vim/pack/syntax/start/vim-protobuf"
if [ -d $folder ]; then
  git -C $folder pull
else
  git clone https://github.com/uarun/vim-protobuf.git $folder
fi

## END syntax

## START colors

# desert256v2 colors
mkdir -p ~/.vim/colors
wget -qN https://raw.githubusercontent.com/flazz/vim-colorschemes/master/colors/desert256v2.vim -P ~/.vim/colors/

## END colors
