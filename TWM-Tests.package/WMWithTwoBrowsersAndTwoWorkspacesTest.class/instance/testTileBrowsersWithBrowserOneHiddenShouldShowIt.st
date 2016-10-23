tile tests
testTileBrowsersWithBrowserOneHiddenShouldShowIt
	browser1 hide.
	windowManager tileBrowsers.
	self assert: (windowManager visibleWindows includes: browser1).
	self assert: browser1 visible.