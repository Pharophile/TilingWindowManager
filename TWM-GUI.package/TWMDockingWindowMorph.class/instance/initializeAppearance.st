initialization
initializeAppearance
	self 
		changeProportionalLayout;
		extent: self defaultExtent;
		color: (self theme worldMainDockingBarColorFor: self).