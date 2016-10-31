move tests
testTopWindowMoveRightShouldPlaceIt
	inspector activate.
	windowManager topWindowMoveRight.
	self assert: (100@0 extent: 100@200) equals: inspector bounds.