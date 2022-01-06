#!/bin/bash
#
#
#
session="workspace"

# Check if the session exists, discarding output
# We can check $? for the exit status (zero for success, non-zero for failure)
#tmux has-session -t $session 2>/dev/null
tmux new-session -A -s $session

#if [ $? != 0 ]; then
  # Set up your session
#  sudo tmux new -s $session;
#fi

# Attach to created session
#tmux attach-session -t $session
