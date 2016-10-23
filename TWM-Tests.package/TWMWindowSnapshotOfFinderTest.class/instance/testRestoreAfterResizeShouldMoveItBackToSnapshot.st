tests
testRestoreAfterResizeShouldMoveItBackToSnapshot
	finder bounds: (50@50 corner: 180@230).
	self assert: (50@50 corner: 180@230) equals: finder bounds.
	
	snapshot restore.
	self assert: (10@10 corner: 120@120) equals: finder bounds.