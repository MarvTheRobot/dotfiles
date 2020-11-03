# dotfiles

- [install.sh](./install.sh); Install PowerShell and Launch install.ps1
- [install.ps1](./install.ps1); Create symlinks and configure base environment
  - Should really have an OS bootstrap script linked into this for new builds

Basic set of dotfiles

1. `~/.config`: Backup if exists, replace with symlink. 
1. `~/.pwshrc.ps1`: Symlink to `./pwshrc.ps1`
1. `.