menus
updateBrowsersMenu: aMenu

	aMenu 
		add: 'Tile browsers' target: self windowManager selector: #tileBrowsers icon: self tileIcon;
		add: 'New browser' target: Smalltalk tools selector: #openClassBrowser icon: self openNewIcon.
	
	self 
		addWindows: self windowManager browsers 
		toMenu: aMenu.

