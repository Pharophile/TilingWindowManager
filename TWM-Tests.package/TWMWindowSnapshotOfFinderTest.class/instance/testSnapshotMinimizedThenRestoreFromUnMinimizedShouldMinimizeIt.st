tests
testSnapshotMinimizedThenRestoreFromUnMinimizedShouldMinimizeIt
	finder minimize.
	snapshot snapshot: finder. 
	finder expandBoxHit.
	snapshot  restore.
	self assert: finder isMinimized.