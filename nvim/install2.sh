#!/bin/bash

minVersion=0.9.5

if command -v nvim &> /dev/null
then
  read -p 'nvim was not found on your system. Install? (y/N)' install
  
  case "$install" in
    y|Y) echo "Continuing.."
    ;;
    n|N) exit 1
    ;;
    *) exit 1
    ;;
  esac
fi

if ! $(printf '%s\n' "$minVersion" "$installedVersion" | sort -C -V)
then
  echo "Yikes!"
fi

echo $minVersion
echo $installedVersion
