Neson's dotfiles
================

## Installation

```bash
git clone https://github.com/Neson/dotfiles.git
dotfiles/install
```
The installation script will create symlink (or copy them if their app dosen't support linked configuration file) for all the dotfiles included, and automatically backup/replace old ones.


## Update

`cd` into the local `dotfiles` repository and then:
```bash
git pull
./install
```

## Copy local settings to the repo

`cd` into the local `dotfiles` repository and then:

- Sublime Text 2: `./copy_subl2_settings`
- git: `./copy_gitcfg_settings`
