versions
version501: spec
	<version: '5.0.4' imports: #('5.0-baseline')>

	spec for: #common do: [
		spec blessing: #development.
		spec author: 'Philippe Back'.
		spec description: 'Make TWM work in Pharo 5.x'.
	].
	
	spec for: #pharo do: [		
		spec
			package: 'TWM-Core' with: 'TWM-Core-PhilippeBack.21';
			package: 'TWM-GUI' with: 'TWM-GUI-PhilippeBack.24';
			package: 'TWM-Tests' with: 'TWM-Tests-PhilippeBack.7';
			package: 'TWM-KeyMapping' with: 'TWM-KeyMapping-PhilippeBack.6';
			package: 'TWM-Theme' with: 'TWM-Theme-PhilippeBack.5'
	]
			