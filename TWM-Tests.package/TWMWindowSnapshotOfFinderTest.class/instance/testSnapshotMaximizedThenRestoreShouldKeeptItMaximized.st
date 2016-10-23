tests
testSnapshotMaximizedThenRestoreShouldKeeptItMaximized
	finder maximize.
	snapshot snapshot: finder. 
	
	snapshot  restore.
	self assert: finder isMaximized.