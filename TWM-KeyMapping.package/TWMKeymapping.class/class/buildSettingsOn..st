shortcuts
buildSettingsOn: aBuilder  
	<systemsettings>
	"See shortucts accessor to add/change a shortcut "

	(aBuilder group: #twmShortcuts)
		label: 'Key mapping' translated;
		description: 'Tiling Window Manager shortcuts' translated;
		parent: #twm;
		order: 10;
		with: [
			self shortcutsActionAndDescriptionDo: [: aName :aDescription| 
								(aBuilder shortcut: aName)
											shortcutName: aName;
											category: self shortcutCategory;
											label:  aDescription 					].
		].