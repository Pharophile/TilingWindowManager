accessing
lastUsedWindows
	| lastWindows allWindows |
	allWindows := self windows.
	lastWindows := allWindows copyFrom: 1 to: (self class numberOfLastUsedWindows min: allWindows size).
	^ lastWindows