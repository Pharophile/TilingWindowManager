move tests
testTopWindowMoveLeftShouldPlaceIt
	inspector activate.
	windowManager topWindowMoveLeft.
	self assert: (0@0 extent: 100@200) equals: inspector bounds.