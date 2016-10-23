setting tests
testTileLastUsedWindowsShouldTileOnlyLastTwoWindowsUsed
	workspace1 activate.
	browser2 activate.
	workspace2 activate.
	browser1 activate.
	browser1 minimize.
	windowManager tileLastUsedWindows..
	self assert: (0@0 extent: 200@100) equals: browser1 bounds.
	self assert: (0@100 extent: 200@100) equals: workspace2 bounds.
	