menus
updateMultipleWorldMenu: aMenu

	aMenu 
		add: 'New World' target: self selector: #newWorld icon: self openNewIcon;
		add: 'Delete current World' target: TWMWorldManager instance selector: #deleteCurrentWorld icon: self deleteIcon.";
		addLine."
	
	self worldManager worlds keys do: 	[:aWorldName|
												
												aMenu 
													add: aWorldName asString
													target: [self worldManager switchToWorldNamed: aWorldName ifAbsent: [Transcript show: 'Missing world', aWorldName;cr. 'Pharo']]
													selector: #value ].