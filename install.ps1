
function New-Link {
	[cmdletbinding()]
	param (
		[Parameter(Mandatory=$true)]
		[ValidateScript({ Test-Path $_ })]
		[string]$Source,

		[Parameter(Mandatory=$true)]
		[ValidateNotNullOrEmpty()]
		[string]$Target
	)
	[string]$sourcePath = (Resolve-Path -Path $Source -ErrorAction SilentlyContinue).Path.TrimEnd('/').TrimEnd('\')
	[string]$targetPath = $Target

	$item = (Get-Item -Path $targetPath -Force -ErrorAction SilentlyContinue)

	# Item may already exist on the local machine
	if(($item.Exists -eq $true) -and ($item.LinkType -ne 'SymbolicLink')){
		Write-Verbose "$Target already exists. Will backup and replace"
		$date = Get-Date -f yyyymmdd-hhss
		$copy = $item.Fullname.Replace($item.BaseName, "$($item.BaseName)-$date")
		Move-Item -Path $item.Fullname -Destination $copy -ErrorAction Stop

		$item = Get-Item -Path $targetPath -Force -ErrorAction SilentlyContinue
	}
	# Item may already exist and be a SymLink
	If(($item.Exists -eq $true) -and ($item.LinkType -eq 'SymbolicLink')){
		Write-Verbose "A symbolic link already exists at '$targetPath'"
		$itemTarget = (Resolve-Path $item.Target -ErrorAction SilentlyContinue).Path
		
		# Symlink pointing to another location
		if($itemTarget -ne $sourcePath){
			Write-Warning "'$itemTarget' does not point to '$sourcePath'"
			Write-Warning "Replacing link"
			$item | Remove-Item -Force
			$item = Get-Item -Path $Target -Force -ErrorAction SilentlyContinue
		}
		else {
			Write-Information "'$($item.FullName)' already links to '$sourcePath'"
		}
	}

	# The item doesn't exist, create it
	if($item -isnot [object] -or $item.Exists -eq $false){
		Write-Verbose "Creating symlink for $sourcePath -> $targetPath"
		New-Item -Value $sourcePath -Path $targetPath -ItemType SymbolicLink
	}
}


################################################################################
#                      Base Configuration Items                                #
#
# Link in .config
New-Link -Source "./config" -Target "~/.config" -Verbose



################################################################################
#                      Configure Environment                                   #
################################################################################
#
# POWERSHELL profile and install core modules

New-Link -Source "./pwshrc.ps1" -Target "~/.pwshrc.ps1"
New-Link -Source "./requirements.json" -Target "~/.requirements.json"
New-Link -Source "./requirements.psd1" -Target "~/.requirements.psd1"

if(-not (Get-PSRepository -Name 'PsGallery')){
	Register-PSRepository -PSGallery
}
if(-not (Get-PSRepository -Name 'PsGallery').IntallationPolicy -eq 'Untrusted'){
	Set-PSRepository -Name PsGallery -InstallationPolicy Trusted
}

################################################################################
#                            Fonts????                                         #
#                                                                              #
# Hack Nerd Font Mono, fantasqueSansMono Nerd Font, Cascadia Mono Pl, Hack,

# I think I'm going to need to break things out by O/S with some shared config

################################################################################
#                      Application Settings                                    #
#
# Visual Studio Code Settings
## I want a way of sharing some settings between apps and some specific

if($isMacos){
	# Linux has these in .config, which is just symlinked anyway
	# if Windows needs them in a different place, it'll be worth having a path lookup
	if(Get-Command 'code'){
		$sp = "~/Library/Application Support/Code/User"
		New-Link -Source "./config/Code/User/settings.json" -Target "$sp/settings.json" 
		New-Link -Source "./config/Code/User/keybindings.json" -Target "$sp/keybindings.json"
	}
	if(Get-Command 'code-insiders'){
		$sp = "~/Library/Application Support/Code - Insiders/User"
		New-Link -Source "./config/Code - Insiders/User/settings.json" -Target "$sp/settings.json"
		New-Link -Source "./config/Code - Insiders/User/keybindings.json" -Target "$sp/keybindings.json"
	}
}


Install-Module PsDepend -Scope CurrentUser -Force
Import-Module PsDepend
Invoke-PsDepend "~/.requirements.psd1" -Force


<# PowerShellGetv3 - Not working, don't know why
# Install-PSResource: /Users/marv/code/mtr/dotfiles/install.ps1:107:1
# Line |
# 107 |  Install-PSResource -RequiredResourceFile ./requirements.json
#     |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#     | Value cannot be null. (Parameter 'value')


	if(-not (Get-Command Install-PSResource)){
		pwsh -c 'Install-Module -Scope CurrentUser -Force -AllowPrerelease -AllowClobber PowerShellGet'
	}
	if(-not (Get-PSResourceRepository -Name 'PsGallery')){
		Register-PSResourceRepository -PSGallery
	}
	if(-not (Get-PSResourceRepository -Name 'PsGallery').Trusted -eq 'True'){
		Set-PSResourceRepository -Trusted PsGallery
	}

#This is throwing an error. Works if you install a module directly
	Install-PSResource -RequiredResourceFile (Join-Path $PsScriptRoot requirements.json)
#> 
