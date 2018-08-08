#/bin/bash

echo -n "Install vim plugins ... "

sed '0,/^#EOF#$/d' "$0" | tar zx -C ~

echo "Done"

echo -n "Add PS1 prompt with git? (Y/n)"
read install_prompt

if [ "${install_prompt}" == "n" ]; then
  echo "Skip prompt install"
else
  cat .bashrc_prompt >> ~/.bashrc 
fi

exit
#EOF#
