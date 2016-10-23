tests
testBackwardOnceThenForwardShouldRestoreAllMinimize
	worldRecorder backward forward.
	self assert: {} equals: windowManager visibleWindows.