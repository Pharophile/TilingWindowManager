move tests
testTopWindowMoveTopLeftShouldPlaceIt
	inspector activate.
	windowManager topWindowMoveTopLeft.
	self assert: (0@0 extent: 100@100) equals: inspector bounds.