filter tests
testCycleClockwiseShouldPutBrowser1BeforeAllOtherWindows
	windowManager cycleClockwise.
	self assert: {workspace1. browser2.browser1. workspace2.} equals: windowManager visibleWindows.   