menus
updateWindowsMenu: aMenu
	aMenu 
		add: 'Tile visible windows' target: self windowManager selector: #tileVisibleWindows icon: self tileVisibleWindowsIcon;
		add: 'Tile last used windows' target: self windowManager selector: #tileLastUsedWindows icon: self tileLastUsedWindowsIcon;
		add: 'Maximize all windows' target: self windowManager selector: #maximizeAllWindows icon: self maximizeAllWindowsIcon;
		add: 'Minimize all windows' target: self windowManager selector: #minimizeAllWindows icon: self minimizeAllWindowsIcon.
		
	
	self 
		addWindows: self windowManager windows 
		toMenu: aMenu.