tests
testBackwardOnceShouldRestoreBrowsers
	worldRecorder backward.
	self assert: {browser2. browser1.} equals: windowManager visibleWindows.