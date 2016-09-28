#!/bin/bash
set -e

case ${1} in
  app:help)
    echo "Available options:"
    echo " app:start         - XXX)"
    echo " [command]        - Execute the specified command, eg. bash."
    ;;
  app:start)
    shift
    echo "Profiles to perform: $(ls -1 conf/*.conf | wc -l)"
    for profile in conf/*.conf; do
      echo "Profile: $profile"
      tartarus $* "$profile"
      echo
    done
    ;;
  *)
    exec "$@"
    ;;
esac
