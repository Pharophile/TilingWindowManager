tests
testRestoreAfterCloseShouldDoNothing
	finder delete.
	snapshot restore.
	self assert: {} equals: windowManager windows.