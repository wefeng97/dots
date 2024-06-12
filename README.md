# My dot files for Linux.

The repository contains my dot files for Linux system. 

## Structure

The repo contains a global bash script `.bash_global` and a `.config` directory with configuration files for various applications.

The applications are not mandatory to be installed, but the configuration files are there in case you want to use them. The applications are: Yazi, Neovim, Alacritty, Kitty, Tmux, waybar, Swaylock, Hyprland, Hyprpaper, Hypridle, wlogout, rofi. 

## Requirements

Please ensure the following dependencies are installed:

### Git 

```
sudo pacman -S git
```

### GNU Stow 

```
sudo pacman -S stow
```

## Installation

First, clone the repository to your home directory and navigate to it:

```
$ git clone https://github.com/wefeng97/dots.git ~/.dots && cd ~/.dots
```

Then create a symbolic link using stow. 

```
$ stow .
```

This will create symbolic links for all the configuration files in the repository. In case the file already exists, it will abort the operation. Please then remove the files and re-run the command. 
