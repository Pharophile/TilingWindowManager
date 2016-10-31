settings
displayEnableTWMSettingsOn: aBuilder
	<systemsettings>
	(aBuilder setting: #showTWMBar) 
		label: 'Enable Tiling Window Manager' translated;
		target: TWMBar;
		parent: #twm;
		description: 'Open a dock with TWM actions' translated;
		order: 1
