move tests
testTopWindowMoveBottomRightShouldPlaceIt
	inspector activate.
	windowManager topWindowMoveBottomRight.
	self assert: (100@100 extent: 100@100) equals: inspector bounds.