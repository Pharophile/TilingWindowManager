move tests
testTopWindowMoveTopShouldPlaceIt
	inspector activate.
	windowManager topWindowMoveTop.
	self assert: (0@0 extent: 200@100) equals: inspector bounds.