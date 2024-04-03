#!/bin/bash

main ()
{
  minVersion=0.9.5
  
  if ! command -v nvim &> /dev/null
  then
    read -p 'Nvim was not found on your system. Install? (y/N) ' install
  
    case "$install" in
      y|Y) get_nvim
      ;;
      n|N) exit 1
      ;;
      *) exit 1
      ;;
    esac 
  fi

  echo "Installing dependencies"
  sudo apt update && sudo apt install curl gcc fuse unzip 

  installedVersion=$(nvim -v | awk '/NVIM/ {print substr($2, 2)}')

  if ! $(printf '%s\n' "$minVersion" "$installedVersion" | sort -C -V)
  then
    read -p "You have installed nvim version $installedVersion which is lower than min required version $minVersion. Do you want to upgrade? (y/N) " upgrade

    case "$upgrade" in
      y|Y) get_nvim
        ;;
    esac
  fi

  read -p "Do you wish to copy nvim config files to your .config folder? (y/N) " copy

  case "$copy" in
    y|Y) copy_files
      ;;
    n|N) exit 1
      ;;
    *) exit 1
      ;;
  esac
}

get_nvim ()
{
  echo "Getting nvim latest"
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage

  echo "Setting permissions"
  chmod u+x nvim.appimage

  echo "Moving nvim into /usr/local/bin/nvim"
  sudo mv nvim.appimage /usr/local/bin/nvim
}

backup_folder ()
{
  echo "Backing up your nvim folder"
  mv ~/.config/nvim ~/.config/nvim-bak
  echo "Backup complete. Your old config is located at ~/.config/nvim-bak"
}

copy_files ()
{
  if [ -d ~/.config/nvim ]; then
    read -p "Seems you have an nvim folder already, do you want to back it up? (y/N) " backup

    case "$backup" in
      y|Y) backup_folder
      ;;
      n|N) rm -rf ~/.config/nvim
      ;;
      *) rm -rf ~/.config/nvim
      ;;
    esac
  fi

  echo "Copying nvim folder into ~/.config/"
  mkdir -p ~/.config/nvim && cp -r config/* ~/.config/nvim
}

main "$@"; exit

