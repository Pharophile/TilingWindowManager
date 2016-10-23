menus
newBrowsersMenu
	"This is where we rebuild the menu for browsers"
	
	^ self newMenu: #updateBrowsersMenu:  icon: self browsersMenuIcon help: 'Browsers actions'