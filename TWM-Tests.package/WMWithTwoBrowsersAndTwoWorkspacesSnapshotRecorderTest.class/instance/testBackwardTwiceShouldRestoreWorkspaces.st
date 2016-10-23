tests
testBackwardTwiceShouldRestoreWorkspaces
	worldRecorder backward.
	worldRecorder backward.
	
	self assert: {workspace2. workspace1.} equals: windowManager visibleWindows.