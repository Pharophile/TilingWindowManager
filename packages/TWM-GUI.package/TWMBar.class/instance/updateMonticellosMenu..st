menus
updateMonticellosMenu: aMenu
	aMenu 
		add: 'Tile Monticello tools' target: self windowManager selector: #tileMonticellos icon: self tileIcon;
		add: 'New Monticello browser' target: Smalltalk tools selector: #openMonticelloBrowser icon: self openNewIcon.
	
	self 
		addWindows: self windowManager monticellos 
		toMenu: aMenu.
		