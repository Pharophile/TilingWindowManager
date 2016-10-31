filter tests
testWithBrowserOneMinimizedVisibleWindowsShouldReturnAllButBrowserOne
	browser1 minimize.
	self assert: {workspace2. workspace1. browser2. } equals: windowManager visibleWindows.