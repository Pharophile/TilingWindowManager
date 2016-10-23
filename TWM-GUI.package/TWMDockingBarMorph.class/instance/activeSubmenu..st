control
activeSubmenu: aSubmenu
	"This is where submenus get automagically updated"
	(aSubmenu notNil and: [ aSubmenu respondsTo: #updateMenu]) ifTrue: [aSubmenu updateMenu].
	super activeSubmenu: aSubmenu.