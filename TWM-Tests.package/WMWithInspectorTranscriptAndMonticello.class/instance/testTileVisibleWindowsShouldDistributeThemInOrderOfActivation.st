tile tests
testTileVisibleWindowsShouldDistributeThemInOrderOfActivation
	inspector activate.
	transcript activate.
	monticello activate.
	windowManager tileVisibleWindows.
	self assert: (0@0 extent: 200@100) equals: monticello bounds.
	self assert: (0@100 extent: 100@100) equals: transcript bounds.
	self assert: (100@100 extent: 100@100) equals: inspector bounds.
	

	transcript activate.
	windowManager tileVisibleWindows.
	self assert: (0@0 extent: 200@100) equals: transcript bounds.
	self assert: (0@100 extent: 100@100) equals: monticello bounds.
	self assert: (100@100 extent: 100@100) equals: inspector bounds.
	