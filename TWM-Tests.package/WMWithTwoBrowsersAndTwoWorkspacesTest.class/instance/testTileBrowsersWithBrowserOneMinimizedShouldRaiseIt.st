tile tests
testTileBrowsersWithBrowserOneMinimizedShouldRaiseIt
	browser1 minimize.
	windowManager tileBrowsers.
	self assert: (windowManager visibleWindows includes: browser1).