@{
	PSDependOptions = @{
			Target = 'CurrentUser'
			Parameters = @{
					Repository = 'PSGallery'
					AllowPrerelease = $True
			}
	}

	'posh-git' = 'latest'
	'oh-my-posh' = 'latest'
}