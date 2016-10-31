filter tests
testWithWorkspaceOneMinimizedWorkspacesShouldReturnWorkspaceOneAndTwo
	workspace1 minimize.  
	self assert: {workspace2. workspace1} equals: windowManager workspaces. 