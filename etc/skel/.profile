# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

TMUX="workspace"
SCREENHEIGHT="1080"
SCREENWIDTH="1920"
unset $TMUX
#tmux new-session -s -t $TMUX
#unset $TMUX
#tmux new-session -A -s $TMUX
#mux new-session \; setw force-width $SCREENWIDTH \; setw force-height $SCREENHEIGHT \; -A -s $TMUX


if [ "$TERM_PROGRAM" = "tmux" ]; then
	echo "Currently in a tmux session attaching"
	tmux attach
else
	echo "Not in a session starting new session"
	tmux new-session -A -s $TMUX
fi



# exec ~/.doweFiles/neofetch



