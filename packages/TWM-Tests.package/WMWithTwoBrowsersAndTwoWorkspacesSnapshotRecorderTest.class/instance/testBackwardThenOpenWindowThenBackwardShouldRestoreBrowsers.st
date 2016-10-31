tests
testBackwardThenOpenWindowThenBackwardShouldRestoreBrowsers
	| newWindow |
	worldRecorder backward.
	
	newWindow := SystemWindow new openInWorld: testWorld; yourself.
	worldRecorder backward.
	
	self assert: {browser2. browser1. newWindow} equals: windowManager visibleWindows.