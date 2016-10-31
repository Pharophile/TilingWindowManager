tile tests
testTileVisibleWindowsWithVerticalLayoutStrategyShouldDistributeThemInOrderOfActivation
	inspector activate.
	transcript activate.
	monticello activate.
	TilingWM layoutStrategyClassName: #TWMVerticalLayoutStrategy.
	windowManager tileVisibleWindows.
	self assert: (0@0 extent: 100@200) equals: monticello bounds.
	self assert: (100@0 extent: 100@100) equals: transcript bounds.
	self assert: (100@100 extent: 100@100) equals: inspector bounds.
	