tests
testBackwardTwiceThenForwardShouldRestoreBrowsers
	worldRecorder backward backward forward.
	
	self assert: {browser2. browser1.} equals: windowManager visibleWindows.