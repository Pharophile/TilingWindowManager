move tests
testTopWindowMoveTopRightShouldPlaceIt
	inspector activate.
	windowManager topWindowMoveTopRight.
	self assert: (100@0 extent: 100@100) equals: inspector bounds.