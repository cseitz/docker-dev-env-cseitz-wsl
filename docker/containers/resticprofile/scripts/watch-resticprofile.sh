#!/bin/bash -eu

function onChange {
  echo "--- (resticprofile init each profile) ----------------"
  echo "$(bash /opt/denv/scripts/resticprofile/init.sh)";
  echo "---------------------------------------------------"
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
