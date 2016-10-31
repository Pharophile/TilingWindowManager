tests
testShouldNotBeEqualsAnotherSnapshotAfterMoving
	finder bounds: (50@50 corner: 205@190).
	self deny: snapshot = (TWMWindowSnapshot of: finder)