tests
testRestoreWithoutMovingShouldKeepFinderAtItsPlace
	snapshot restore.
	self assert: (10@10 corner: 120@120) equals: finder bounds.