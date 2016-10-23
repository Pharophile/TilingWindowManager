snapshot
snapshot:   aSystemWindow 
	window := aSystemWindow.
	bounds := window bounds.
	shouldRestoreMinimized := window isMinimized.
	shouldRestoreMaximized := window isMaximized.