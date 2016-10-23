filter tests
testCycleCounterClockwiseShouldPutWorkspace2AfterAllOtherWindows
	windowManager cycleCounterClockwise.
	self assert: {browser1. workspace2. workspace1. browser2.} equals: windowManager visibleWindows.