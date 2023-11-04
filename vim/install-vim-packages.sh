#!/usr/bin/env bash
set -euf -o pipefail
# Install and Update vim plugins
# does not delete them or move them from required to optional

### CONFIG
# required plugin path is "pack/plugin/start/"
# optional plugin path is "pack/plugin/opt/"
# required syntax plugin path is "pack/syntax/start/"
# format is
# [name]="folder repository submodule"
# use submodule for git repos that use other repos as a submodule
declare -r -A PLUGINS=(
  [python-mode]="pack/plugin/start/python-mode https://github.com/python-mode/python-mode.git submodule"
  [jedi-vim]="pack/plugin/start/jedi-vim https://github.com/davidhalter/jedi-vim.git submodule"
  [vim-airline]="pack/plugin/start/vim-airline https://github.com/vim-airline/vim-airline.git"
  [ale]="pack/plugin/start/ale https://github.com/dense-analysis/ale.git" 
  [vim-scala]="pack/plugin/opt/vim-scala  https://github.com/derekwyatt/vim-scala.git"
  [vim-fireplace]="pack/plugin/opt/vim-fireplace https://github.com/tpope/vim-fireplace.git" 
  [rust-syntax]="pack/syntax/start/rust https://github.com/rust-lang/rust.vim.git"
  [docker-syntax]="pack/syntax/start/dockerfile https://github.com/ekalinin/Dockerfile.vim.git"
  [json-syntax]="pack/syntax/start/vim-json https://github.com/elzr/vim-json.git"
  [mustache-syntax]="pack/syntax/start/vim-mustache-handlebars https://github.com/derekwyatt/vim-scala.git"
  [protobuf-syntax]="pack/syntax/start/vim-protobuf https://github.com/uarun/vim-protobuf.git"
)

# loop through all plugin configs
for plugin in "${!PLUGINS[@]}"
do
  echo "refreshing ${plugin}"
  # parse config string
  read -r folder repo submodule <<< "${PLUGINS[${plugin}]}"
  # prefix folder path
  folder="${HOME}/.vim/${folder}"
  # echo "folder is ${folder}"
  # echo "repo is ${repo}"
  # echo "submodule is ${submodule}"

  ### create command
  if [ "$submodule" = "submodule" ]
  then
    if [ -d "$folder" ]; then
      cmd="git -C ${folder} submodule update --init --recursive"
    else
      cmd="git clone --recurse-submodules $repo $folder"
    fi
  else
    if [ -d "$folder" ]; then
      cmd="git -C $folder pull"
    else
      cmd="git clone $repo $folder"
    fi
  fi

  ### run command
  echo "${cmd}"
  $cmd

done

## START colors

# desert256v2 colors
# I only want this one color, not the whole repo, so not cloning
# just grab the one file
echo "desert256v2 colors"
mkdir -p ~/.vim/colors
wget -qN https://raw.githubusercontent.com/flazz/vim-colorschemes/master/colors/desert256v2.vim -P ~/.vim/colors/

# END colors
