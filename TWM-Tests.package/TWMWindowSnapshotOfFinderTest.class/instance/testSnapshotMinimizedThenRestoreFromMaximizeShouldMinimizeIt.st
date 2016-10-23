tests
testSnapshotMinimizedThenRestoreFromMaximizeShouldMinimizeIt
	finder minimize.
	snapshot snapshot: finder. 
	finder maximize.
	snapshot  restore.
	self assert: finder isMinimized.