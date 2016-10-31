move tests
testTopWindowMoveBottomShouldPlaceIt
	inspector activate.
	windowManager topWindowMoveBottom.
	self assert: (0@100 extent: 200@100) equals: inspector bounds.