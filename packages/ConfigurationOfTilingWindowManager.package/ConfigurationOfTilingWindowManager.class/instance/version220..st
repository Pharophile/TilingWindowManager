versions
version220: spec
	<version: '2.2.0' imports: #('2.0-baseline')>

	spec for: #common do: [
		spec blessing: #development.
		spec author: 'Sean DeNigris'.
		spec description: 'UI to move a morph between worlds easily. When Pharo Issue 10910 is resolved, we can hook into the window menu to move tools back and forth with a few clicks'.
	].
	
	spec for: #pharo do: [		
		spec
			package: 'TWM-Core' with: 'TWM-Core-SeanDeNigris.7';
			package: 'TWM-GUI' with: 'TWM-GUI-SeanDeNigris.10';
			package: 'TWM-Tests' with: 'TWM-Tests-LaurentLaffont.4';
			package: 'TWM-KeyMapping' with: 'TWM-KeyMapping-LaurentLaffont.5';
			package: 'TWM-Theme' with: 'TWM-Theme-LaurentLaffont.4'
	]
			