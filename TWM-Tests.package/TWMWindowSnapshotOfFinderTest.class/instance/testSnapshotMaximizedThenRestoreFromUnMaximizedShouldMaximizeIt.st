tests
testSnapshotMaximizedThenRestoreFromUnMaximizedShouldMaximizeIt
	finder maximize.
	
	snapshot snapshot: finder. 
	finder expandBoxHit.
	self deny: finder isMaximized.
	
	snapshot  restore.
	self assert: finder isMaximized.