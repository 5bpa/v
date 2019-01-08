#!/bin/bash

tar czf vim.tar.gz .vimrc .vim
cp extract.sh v.sh
cat vim.tar.gz >> ./v.sh
