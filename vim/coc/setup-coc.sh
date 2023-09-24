#!/usr/bin/env bash

set -eu

# Install extensions and exit
vim -c 'CocInstall -sync @yaegassy/coc-pylsp coc-vimtex coc-lists coc-snippets|q'

# Copy over the coc-settings.json file to the appropriate location
if [[ -e coc-settings.json ]]; then
	install -v coc-settings.json $HOME/.vim/
fi
