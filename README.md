# dotfiles

- [install.sh](./install.sh); Install PowerShell and Launch install.ps1
- [install.ps1](./install.ps1); Create symlinks and configure base environment
  - Should really have an OS bootstrap script linked into this for new builds

Basic set of dotfiles

1. Symlink `~/.config': Rather than micro-manage the content, all changes will 
  appear in repo and be added or gitignored