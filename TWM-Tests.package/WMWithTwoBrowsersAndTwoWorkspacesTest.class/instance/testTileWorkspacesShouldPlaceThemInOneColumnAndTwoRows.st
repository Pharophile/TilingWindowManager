tile tests
testTileWorkspacesShouldPlaceThemInOneColumnAndTwoRows
	windowManager tileWorkspaces.
	self assert: (0@0 extent: 200@100) equals: workspace2 bounds.
	self assert: (0@100 extent: 200@100) equals: workspace1 bounds.