menus
newWorldMenu
	^ DockingBarMenuItemMorph new
		contents: '';
		subMenu:  (TWMUpdatingMenuMorph new updater: self updateSelector: #updateWorldMenu:);
		icon: self openWorldMenuIcon;
		setBalloonText: 'Open World menu'.