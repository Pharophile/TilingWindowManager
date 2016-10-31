tests
testShouldNotBeEqualsAnotherSnapshotAfterMinimize
	finder minimize.
	self deny: snapshot = (TWMWindowSnapshot of: finder)