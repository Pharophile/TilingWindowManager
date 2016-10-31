tests
testRestoreAfterMaximizeShouldUnmaximizeIt
	finder maximize.
	snapshot restore.
	
	self assert: (10@10 corner: 120@120) equals: finder bounds.
	self deny: finder isMaximized.
	self deny: finder isMinimized.