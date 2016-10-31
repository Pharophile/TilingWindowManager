accessing
visibleWindows 
	^ self windows reject: [:aWindow| aWindow isMinimized]