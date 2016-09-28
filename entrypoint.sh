#!/bin/bash
set -e

init_passphrase() {
  if [[ -v ENCRYPT_PASSPHRASE ]]; then
    local path=$PWD/passphrase
    echo "Storing encryption passphrase to $path"
    echo
    echo "You can use it in Tartarus using:"
    echo "ENCRYPT_PASSPHRASE_FILE=\"$path\""
    echo
    echo $ENCRYPT_PASSPHRASE > $path
    chmod 400 $path
  fi
}

case ${1} in
  app:help)
    echo "Available options:"
    echo " app:start         - XXX)"
    echo " [command]        - Execute the specified command, eg. bash."
    ;;
  app:start)
    shift
    init_passphrase
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
