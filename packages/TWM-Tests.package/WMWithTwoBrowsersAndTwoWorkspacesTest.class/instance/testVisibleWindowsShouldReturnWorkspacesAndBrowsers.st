filter tests
testVisibleWindowsShouldReturnWorkspacesAndBrowsers
	self assert: {workspace2. workspace1. browser2. browser1.} equals: windowManager visibleWindows.   