versions
version13: spec
	<version: '1.3' imports: #('1.3-baseline')>

	spec for: #common do: [
		spec blessing: #release.
		spec author: 'Laurent Laffont'.
		spec description: 'split TWM into several packages to handle dependencies'.
	].
	
	spec for: #pharo do: [		
		spec
			project: 'Keymapping' with: '2.2';
			package: 'TWM-Core' with: 'TWM-Core-LaurentLaffont.4';
			package: 'TWM-GUI' with: 'TWM-GUI-LaurentLaffont.7';
			package: 'TWM-Tests' with: 'TWM-Tests-LaurentLaffont.3';
			package: 'TWM-KeyMapping' with: 'TWM-KeyMapping-LaurentLaffont.3';
			package: 'TWM-Theme' with: 'TWM-Theme-LaurentLaffont.4'
	]
			