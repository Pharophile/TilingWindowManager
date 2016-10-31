menus
newMenu: aSelector icon: aForm help: aString 
	^ DockingBarMenuItemMorph new
		contents: '';
		subMenu: (TWMUpdatingMenuMorph new updater: self updateSelector: aSelector);
		icon: aForm;
		setBalloonText: aString.