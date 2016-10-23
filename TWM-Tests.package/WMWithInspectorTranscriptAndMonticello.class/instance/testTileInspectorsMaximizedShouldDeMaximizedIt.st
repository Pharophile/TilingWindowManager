tile tests
testTileInspectorsMaximizedShouldDeMaximizedIt
	inspector maximize.
	windowManager tileInspectors.
	self deny: inspector isMaximized.