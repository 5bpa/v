#/bin/bash

echo -n "Install vim plugins ... "

sed '0,/^#EOF#$/d' "$0" | tar zx -C ~

echo "Done"

echo -n "Add PS1 prompt with git? (Y/n)"
read install_prompt

if [ "${install_prompt}" == "n" ]; then
  echo "Skip prompt install"
else

	cat << HEREDOC >> ~/.bashrc
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

if [ "\$color_prompt" = yes ]; then
    PS1='\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[\033[33m\]\$(parse_git_branch)\[\033[00m\]\\\$ '
else
    PS1='\${debian_chroot:+(\$debian_chroot)}\u@\h:\w \[\033[33m\]\$(parse_git_branch)\[\033[00m\]\\\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "\$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\${debian_chroot:+(\$debian_chroot)}\u@\h: \w\a\]\$PS1"
    ;;
*)
    ;;
esac
HEREDOC
fi

exit
#EOF#
