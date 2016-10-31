menus
addWindows: windows toMenu: aMenu withLabel: aBlock
	"aMenu addLine."
	windows do: [:aWindow| 
						aMenu 
							add:  (aBlock value: aWindow)
							target: aWindow 
							selector:  #expandAndActivate.
						aMenu lastItem icon: aWindow taskbarIcon].	
	