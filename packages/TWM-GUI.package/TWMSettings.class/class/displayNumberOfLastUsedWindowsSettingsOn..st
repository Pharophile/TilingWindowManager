settings
displayNumberOfLastUsedWindowsSettingsOn: aBuilder
	<systemsettings>
	(aBuilder setting: #numberOfLastUsedWindows) 
		label: 'Last used windows to show' translated;
		target: TilingWM;
		parent: #twm;
		order: 3;
		description: 'Number of last used windows to show' translated.
