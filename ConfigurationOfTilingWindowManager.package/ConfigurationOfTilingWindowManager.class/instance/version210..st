versions
version210: spec
	<version: '2.1.0' imports: #('2.0-baseline')>

	spec for: #common do: [
		spec blessing: #release.
		spec author: 'Sean DeNigris'.
		spec description: 'Move a morph between worlds easily'.
	].
	
	spec for: #pharo do: [		
		spec
			package: 'TWM-Core' with: 'TWM-Core-SeanDeNigris.6';
			package: 'TWM-GUI' with: 'TWM-GUI-SeanDeNigris.9';
			package: 'TWM-Tests' with: 'TWM-Tests-LaurentLaffont.4';
			package: 'TWM-KeyMapping' with: 'TWM-KeyMapping-LaurentLaffont.5';
			package: 'TWM-Theme' with: 'TWM-Theme-LaurentLaffont.4'
	]
			