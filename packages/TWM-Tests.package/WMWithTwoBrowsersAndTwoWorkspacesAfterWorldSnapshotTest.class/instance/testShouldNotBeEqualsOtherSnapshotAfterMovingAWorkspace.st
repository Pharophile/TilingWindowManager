tests
testShouldNotBeEqualsOtherSnapshotAfterMovingAWorkspace.
	workspace1 maximize.
	self deny: (worldSnapshot = (TWMWorldSnapshot of: testWorld)).