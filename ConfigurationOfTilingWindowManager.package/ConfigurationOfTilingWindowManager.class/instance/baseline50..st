baselines
baseline50: spec 
	<version: '5.0-baseline'>
	
	spec for: #common do: [
		spec blessing: #baseline.
	].
		
	spec for: #pharo do: [
		spec 
			repository: 'http://smalltalkhub.com/mc/PhilippeBack/TWM/main';
			package: 'TWM-Core';
			package: 'TWM-GUI' with: [spec requires: 'TWM-Core'];
			package: 'TWM-KeyMapping' with: [spec requires: 'TWM-GUI'];
			package: 'TWM-Tests' with: [spec requires: #('TWM-GUI' 'TWM-KeyMapping')];
			package: 'TWM-Theme'.
			
		spec 
			group: 'default' with: #('ALL');
			group: 'core' with: #('TWM-GUI')
	]