tile tests
testTileVisibleWindowsShouldPlaceThemInTwoColumnsAndRows
	windowManager tileVisibleWindows.
	self assert: (0@0 extent: 100@100) equals: workspace2 bounds.
	self assert: (100@0 extent: 100@100) equals: workspace1 bounds.
	self assert: (0@100 extent: 100@100) equals: browser2 bounds.
	self assert: (100@100 extent: 100@100) equals: browser1 bounds.