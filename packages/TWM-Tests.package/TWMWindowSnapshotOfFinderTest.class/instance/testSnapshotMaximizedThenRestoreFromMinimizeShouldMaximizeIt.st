tests
testSnapshotMaximizedThenRestoreFromMinimizeShouldMaximizeIt
	finder maximize.
	snapshot snapshot: finder. 
	finder minimize.
	snapshot  restore.
	self assert: finder isMaximized.