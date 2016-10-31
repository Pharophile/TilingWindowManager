baseline
baseline: spec
	<baseline>
	
	spec for: #common do: [
		spec blessing: #baseline.
		spec
			package: 'TWM-Core';
			package: 'TWM-GUI';
			package: 'TWM-KeyMapping';
			postLoadDoIt: #openTWMBar.

		spec
			group: 'default' with: #('TWM-Core' 'TWM-GUI' 'TWM-KeyMapping').
		spec
			group: 'tests' with: #('TWM-Tests').
      ]