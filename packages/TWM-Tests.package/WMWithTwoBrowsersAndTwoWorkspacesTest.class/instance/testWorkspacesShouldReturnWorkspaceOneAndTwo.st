filter tests
testWorkspacesShouldReturnWorkspaceOneAndTwo
	self assert: {workspace2. workspace1} equals: windowManager workspaces.   