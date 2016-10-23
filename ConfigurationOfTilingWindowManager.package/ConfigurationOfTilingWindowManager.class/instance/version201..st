versions
version201: spec
	<version: '2.0.1' imports: #('2.0-baseline')>

	spec for: #common do: [
		spec blessing: #release.
		spec author: 'Laurent Laffont'.
		spec description: 'Respect the Taskbar setting when adding a new world'.
	].
	
	spec for: #pharo do: [		
		spec
			package: 'TWM-Core' with: 'TWM-Core-LaurentLaffont.5';
			package: 'TWM-GUI' with: 'TWM-GUI-SeanDeNigris.9';
			package: 'TWM-Tests' with: 'TWM-Tests-LaurentLaffont.4';
			package: 'TWM-KeyMapping' with: 'TWM-KeyMapping-LaurentLaffont.5';
			package: 'TWM-Theme' with: 'TWM-Theme-LaurentLaffont.4'
	]
			