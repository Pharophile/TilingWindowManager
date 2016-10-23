move tests
testTopWindowMoveBottomLeftShouldPlaceIt
	inspector activate.
	windowManager topWindowMoveBottomLeft.
	self assert: (0@100 extent: 100@100) equals: inspector bounds.