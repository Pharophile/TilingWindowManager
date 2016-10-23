versions
version30: spec
	<version: '3.0-alpha' imports: #('3.0-baseline')>

	spec for: #common do: [
		spec blessing: #release.
		spec author: 'Philippe Back'.
		spec description: 'Pharo 3.0 version'.
	].
	
	spec for: #pharo do: [		
		spec
			package: 'TWM-Core' with: 'TWM-Core-LaurentLaffont.14';
			package: 'TWM-GUI' with: 'TWM-GUI-PhilippeBack.16';
			package: 'TWM-Tests' with: 'TWM-Tests-LaurentLaffont.5';
			package: 'TWM-KeyMapping' with: 'TWM-KeyMapping-LaurentLaffont.5';
			package: 'TWM-Theme' with: 'TWM-Theme-PhilippeBack.5'
	]
			