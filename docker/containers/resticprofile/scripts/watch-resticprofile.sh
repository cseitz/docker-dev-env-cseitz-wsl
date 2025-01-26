#!/bin/bash -eu

function onChange {
  echo "--- (resticprofile schedule --all) ----------------"
  echo "$(resticprofile schedule --all)";
  echo "---------------------------------------------------"
}

function listenForChange {
  inotifywait --recursive \
    --event modify,move,create,delete \
    /etc/resticprofile
}

onChange
while listenForChange; do
  echo "Change detected"
  onChange
done
