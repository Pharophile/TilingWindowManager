menus
updateOtherToolsMenu: aMenu
	| windows |
	aMenu 
		add: 'New TestRunner' target: Smalltalk tools selector: #openTestRunner icon: self openNewIcon.
	
	"All the windows that are not in the tooling"
	windows := ((self windowManager windows 
					copyWithoutAll: self windowManager browsers)
						copyWithoutAll: self windowManager workspaces)
						 	copyWithoutAll: self windowManager monticellos.
	self 
		addWindows: windows 
		toMenu: aMenu.
		