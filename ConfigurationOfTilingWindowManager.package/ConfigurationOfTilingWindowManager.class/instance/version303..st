versions
version303: spec
	<version: '3.0.3' imports: #('3.0-baseline')>

	spec for: #common do: [
		spec blessing: #release.
		spec author: 'Laurent Laffont'.
		spec description: 'Fix TWMDockingWindowMorph for Pharo4'.
	].
	
	spec for: #pharo do: [		
		spec
			package: 'TWM-Core' with: 'TWM-Core-PhilippeBack.17';
			package: 'TWM-GUI' with: 'TWM-GUI-LaurentLaffont.19';
			package: 'TWM-Tests' with: 'TWM-Tests-LaurentLaffont.6';
			package: 'TWM-KeyMapping' with: 'TWM-KeyMapping-PhilippeBack.6';
			package: 'TWM-Theme' with: 'TWM-Theme-PhilippeBack.5'
	]
			