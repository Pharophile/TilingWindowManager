versions
version11: spec
	<version: '1.1' imports: #('1.0-baseline')>

	spec for: #common do: [
		spec blessing: #stable.
		spec author: 'Laurent Laffont'.
		spec description: '- add custom buttons using pragma <twmBarButton>
		                           - KeyMapping 1.9
		                           - various bug fixes
		                           - stable for 1.3'.
	].
	
	spec for: #pharo do: [		
		spec
			project: 'Keymapping' with: '1.9';
			package: 'TWM' with: 'TWM-BernardoContreras.68'.
	]
			