#! /usr/bin/bash

SESSION_NAME='MY_PROJECT'
DRUPAL_PATH='webapp'
DOCKER_PATH='docker'

# Check if session exist
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION_NAME)

# If session doesn't exist, create it
if [ "$SESSIONEXISTS" = "" ]; then
  # Create new session
  tmux new-session    -d -s ${SESSION_NAME}
  tmux rename-window  "MAIN"
  # New window (2) on Drupal root
  tmux new-window     -t ${SESSION_NAME} -c ${DRUPAL_PATH} -n bash
  # New window (9) with docker-compose up
  tmux new-window     -t ${SESSION_NAME} -c ${DOCKER_PATH} -n DOCKER -t 9
  tmux send-keys      -t ${SESSION_NAME} "docker-compose up" ENTER
  # Go to first window
  tmux select-window  -t 1
  # enter docker
  tmux send-keys      -t ${SESSION_NAME} "cd $DOCKER_PATH; sleep 2; docker-compose exec web bash" ENTER C-l
  tmux split-window   -t $SESSION_NAME -h -l 70% vim
fi

# If already in a tmux session, switch client
if [[ $TMUX ]]; then
  tmux switch-client -t $SESSION_NAME
else
  # Attach session
  tmux attach-session -t $SESSION_NAME
fi
