 # ~/.profile: executed by the command interpreter for login shells.
 2 # This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
 3 # exists.
 4 # see /usr/share/doc/bash/examples/startup-files for examples.
 5 # the files are located in the bash-doc package.
 6
 7 # the default umask is set in /etc/profile; for setting the umask
 8 # for ssh logins, install and configure the libpam-umask package.
 9 #umask 022
10
11 # if running bash
12 if [ -n "$BASH_VERSION" ]; then
13     # include .bashrc if it exists
14     if [ -f "$HOME/.bashrc" ]; then
15         . "$HOME/.bashrc"
16     fi
17 fi
18
19 # set PATH so it includes user's private bin if it exists
20 if [ -d "$HOME/bin" ] ; then
21     PATH="$HOME/bin:$PATH"
22 fi
23
24 # set PATH so it includes user's private bin if it exists
25 if [ -d "$HOME/.local/bin" ] ; then
26     PATH="$HOME/.local/bin:$PATH"
27 fi
28
29 TMUX="workspace"
30 SCREENHEIGHT="1080"
31 SCREENWIDTH="1920"
32 #tmux new-session -A -s $TMUX
33 tmux new-session \; setw force-width $SCREENWIDTH \; setw force-height $SCREENHEIGHT \; -A -s $TMUX
34
35 exec ~/.doweFiles/neofetch
36


