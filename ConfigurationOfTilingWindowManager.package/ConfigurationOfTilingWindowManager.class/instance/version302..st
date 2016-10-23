versions
version302: spec
	<version: '3.0.2' imports: #('3.0-baseline')>

	spec for: #common do: [
		spec blessing: #release.
		spec author: 'Laurent Laffont'.
		spec description: 'Keymapping works again. Fixes for Pharo4'.
	].
	
	spec for: #pharo do: [		
		spec
			package: 'TWM-Core' with: 'TWM-Core-PhilippeBack.17';
			package: 'TWM-GUI' with: 'TWM-GUI-PhilippeBack.18';
			package: 'TWM-Tests' with: 'TWM-Tests-LaurentLaffont.6';
			package: 'TWM-KeyMapping' with: 'TWM-KeyMapping-PhilippeBack.6';
			package: 'TWM-Theme' with: 'TWM-Theme-PhilippeBack.5'
	]
			