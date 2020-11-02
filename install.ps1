function New-Link {
	[cmdletbinding()]
	param (
		[Parameter(Mandatory=$true)]
		[ValidateScript({
			Test-Path $_
		})]
		$Source,

		[Parameter(Mandatory=$true)]
		$Target
	)

	$item = Get-Item -Path $Target -Force -ErrorAction SilentlyContinue
	if($item.Exists -eq $false){
		Write-Verbose "Creating symlink for $Source -> $Target"
		$item = New-Link -Value $source -Path $target -ItemType SymbolicLink
	}
	elseIf($item.Exists -eq $true -and $item.LinkType -ne 'SymbolicLink'){
		Write-Error "$Target already exists. Cannot make link"
	}
	elseIf($item.Exists -eq $true -and $item.LinkType -eq 'SymbolicLink'){
		Write-Verbose "$Target already a symlink"	
	}

	Write-Output $item
}

$repo = $PSCommandPath.Replace('install.ps1','')
$dotfiles = Resolve-Path '~/.dotfiles'

# VsCode Settings
## I want a way of sharing some settings between apps and some specific
if(Get-Command 'code'){
	$settingsPath = "~/Library/Application Support/Code"
	New-Link -Source "./settings/vscode/settings.json" -Target "$settingsPath/User/settings.json" 
	New-Link -Source "./settings/vscode/keybindings.json" -Target "$settingsPath/User/keybindings.json"
}

if(Get-Command 'code-insiders'){
	$settingsPath = "~/Library/Application Support/Code - Insiders"
	New-Link -Source "./settings/vscode/settings-insiders.json" -Target "$settingsPath/User/settings.json"
	New-Link -Source "./settings/vscode/keybindings.json" -Target "$settingsPath/User/keybindings.json"
}

# Link powershell profile
New-Link -Source "./pwshrc.ps1" -Target "~/.pwshrc.ps1"
New-Link -Source "./requirements.psd1" -Target "~/.requirements.psd1"

# Link in .config
Get-ChildItem -Path './config' | foreach-object {
	New-Link -Source $_.Fullname -Target "~/.config/$($_.Name)" -Verbose
}

#Change shell
## This will need a password; sure there is a way to elevate at the beginNew-ItemTypeemng?
$pwshPath = (Get-Command -Name 'pwsh').Source
if(($env:TERM_PROGRAM -ne 'vscode') -and ($env:SHELL -ne $pwshPath)){
	#chsh -s /usr/local/bin/pwsh
	#have removed this for a while. ls -a doesn't show symlinks. 
	#need to look into why as this is annoying and makes me not 
	#want to use powershell as my default shell ovel zsh
}

