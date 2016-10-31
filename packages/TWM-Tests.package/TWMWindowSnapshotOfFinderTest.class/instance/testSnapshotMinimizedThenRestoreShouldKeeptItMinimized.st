tests
testSnapshotMinimizedThenRestoreShouldKeeptItMinimized
	finder minimize.
	snapshot snapshot: finder. 
	
	snapshot  restore.
	self assert: finder isMinimized.