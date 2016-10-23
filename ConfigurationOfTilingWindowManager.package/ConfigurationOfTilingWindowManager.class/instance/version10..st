versions
version10: spec
	<version: '1.0' imports: #('1.0-baseline')>

	spec for: #common do: [
		spec blessing: #release.
		spec author: 'GuillePolito'.
		spec description: 'Release 1.0 of this project '.
	].
	
	spec for: #pharo do: [		
		spec 
			project: 'Keymapping' with: '1.7';
			package: 'TWM' with: 'TWM-LaurentLaffont.57'.
	]
			