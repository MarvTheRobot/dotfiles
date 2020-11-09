# dotfiles

- [install.sh](./install.sh); Install PowerShell and Launch install.ps1
- [install.ps1](./install.ps1); Create symlinks and configure base environment
  - Should really have an OS bootstrap script linked into this for new builds

Basic set of dotfiles

1. `~/.config`: Backup if exists, replace with symlink. 
1. `~/.pwshrc.ps1`: Symlink to `./pwshrc.ps1`
1. `~/.requirements.psd1`: Symlink to `./requirements.psd1`, used for PsDepend
1. `~/.requirements.json`: Symlink to `./requirements.json`. for PackageManagementv3
    1. _this is not currently working so we stick with PsDepend_
1. `PsGallery`: Configure as trusted
1. `PsDepend`: Install module and invoke against `~/.requirements.psd1`
1. `VsCode`: 
    1. `Settings.json`: Symlink for MacOS
	1. `Keybindings.json`: Symlink for MacOS

Still to do

- GPG: Need to install and configure, restore keys from KeyVault
- KeyVault: Get secrets, will require adding Az (Cli or Module)


