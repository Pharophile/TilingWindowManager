tests
testForwardShouldKeepAllMinimize
	worldRecorder forward.
	self assert: {} equals: windowManager visibleWindows.