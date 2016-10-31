setting tests
testNumberOfLastUsedWindowsShouldDefaultToThree
	TilingWM numberOfLastUsedWindows: nil.
	self assert: 3 equals: TilingWM numberOfLastUsedWindows.
	