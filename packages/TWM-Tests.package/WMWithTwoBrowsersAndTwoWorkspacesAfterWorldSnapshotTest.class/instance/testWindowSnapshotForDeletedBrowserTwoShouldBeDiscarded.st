tests
testWindowSnapshotForDeletedBrowserTwoShouldBeDiscarded
	self assert:  {workspace2. workspace1. browser1} equals: (worldSnapshot windows)