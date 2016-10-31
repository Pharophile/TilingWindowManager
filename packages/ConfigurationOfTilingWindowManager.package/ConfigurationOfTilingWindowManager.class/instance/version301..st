versions
version301: spec
	<version: '3.0.1' imports: #('3.0-baseline')>

	spec for: #common do: [
		spec blessing: #release.
		spec author: 'Sean DeNigris'.
		spec description: '- Don''t update taskbar setting if user cancels new world creation
- When creating a new world, delegate the restoring to the world manager
- When creating new world, only add TWMBar according to setting
- Fix bug where new Worlds were not restored properly. Defer the restore and growl notification. There is still a weird stutter when changing worlds, where the new world flashes open, the old world shows again, and then the new world finally takes over.'.
	].
	
	spec for: #pharo do: [		
		spec
			package: 'TWM-Core' with: 'TWM-Core-SeanDeNigris.16';
			package: 'TWM-GUI' with: 'TWM-GUI-SeanDeNigris.17';
			package: 'TWM-Tests' with: 'TWM-Tests-LaurentLaffont.5';
			package: 'TWM-KeyMapping' with: 'TWM-KeyMapping-LaurentLaffont.5';
			package: 'TWM-Theme' with: 'TWM-Theme-PhilippeBack.5'
	]
			