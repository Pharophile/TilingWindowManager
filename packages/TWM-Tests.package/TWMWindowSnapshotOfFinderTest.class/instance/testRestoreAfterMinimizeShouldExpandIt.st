tests
testRestoreAfterMinimizeShouldExpandIt
	finder minimize.
	snapshot restore.
	
	self assert: (10@10 corner: 120@120) equals: finder bounds.
	self deny: finder isMinimized.
	self deny: finder isMaximized.