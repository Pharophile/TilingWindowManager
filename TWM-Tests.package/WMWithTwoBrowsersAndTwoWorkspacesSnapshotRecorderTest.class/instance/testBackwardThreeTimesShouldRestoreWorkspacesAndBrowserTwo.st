tests
testBackwardThreeTimesShouldRestoreWorkspacesAndBrowserTwo
	worldRecorder backward backward backward.
	self assert: {workspace2. workspace1. browser2} equals: windowManager visibleWindows.