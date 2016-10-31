tile tests
testTileWorkspacesWithWorkspaceOneMinimizedShouldRaiseIt
	workspace1 minimize.
	windowManager tileWorkspaces.
	self assert: (windowManager visibleWindows includes: workspace1).