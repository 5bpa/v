#/bin/bash

if rpm -qa | grep -q vim; then
  echo "VIM already installed"
else
  yum install -y vim
fi

if rpm -qa | grep -q git; then
  echo "git already installed"
else
  yum install -y git
fi

if [ "$(id -u)" == 0 ]; then
  if [ -e /usr/bin/vi ]; then
    rm /usr/bin/vi
    ln -s /usr/bin/vim /usr/bin/vi
  fi
fi

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
