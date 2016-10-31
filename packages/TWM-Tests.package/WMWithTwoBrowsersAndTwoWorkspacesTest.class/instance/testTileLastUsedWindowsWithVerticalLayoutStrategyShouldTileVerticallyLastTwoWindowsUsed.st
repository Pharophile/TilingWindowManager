setting tests
testTileLastUsedWindowsWithVerticalLayoutStrategyShouldTileVerticallyLastTwoWindowsUsed
	workspace1 activate.
	browser2 activate.
	workspace2 activate.
	browser1 activate.
	browser1 minimize.
	
	TilingWM layoutStrategyClassName: #TWMVerticalLayoutStrategy.
	windowManager tileLastUsedWindows..
	self assert: (0@0 extent: 100@200) equals: browser1 bounds.
	self assert: (100@0 extent: 100@200) equals: workspace2 bounds.