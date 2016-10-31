versions
version12: spec
	<version: '1.2' imports: #('1.0-baseline')>

	spec for: #common do: [
		spec blessing: #development.
		spec author: 'Laurent Laffont'.
		spec description: '- start work for Pharo 1.4'.
	].
	
	spec for: #pharo do: [		
		spec
			project: 'Keymapping' with: '1.9';
			package: 'TWM'.
	]
			