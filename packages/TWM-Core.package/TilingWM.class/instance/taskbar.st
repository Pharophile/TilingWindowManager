accessing
taskbar
	^ world submorphs detect: [:m| m isTaskbar] ifNone: [nil].