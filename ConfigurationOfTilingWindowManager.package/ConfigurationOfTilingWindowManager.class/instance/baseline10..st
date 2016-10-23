baselines
baseline10: spec 
	<version: '1.0-baseline'>
	
	spec for: #common do: [
		spec blessing: #baseline.
	].
		
	spec for: #pharo do: [
		spec repository: 'http://smalltalkhub.com/mc/LaurentLaffont/TilingWindowManager/main'.
		spec project: 'Keymapping' with: [
				spec
					className: 'ConfigurationOfKeymapping';
					file: 'ConfigurationOfKeymapping';
					repository: 'http://www.squeaksource.com/ShortWays' ].
		spec package: 'TWM'.
			
		spec group: 'default' with: #('ALL')
	]