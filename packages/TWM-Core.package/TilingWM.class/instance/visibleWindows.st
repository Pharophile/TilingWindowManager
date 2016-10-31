filter
visibleWindows
	^ self windows select: [:m| m isNotMinimized]. 