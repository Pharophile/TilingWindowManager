tests
testShouldNotBeEqualsAnotherSnapshotAfterMaximize
	finder maximize.
	self deny: snapshot = (TWMWindowSnapshot of: finder)