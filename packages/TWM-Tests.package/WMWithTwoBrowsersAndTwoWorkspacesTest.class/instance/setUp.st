running
setUp
	super setUp.
	
	browser1 := self newBrowserIn: testWorld.
	browser2 := self newBrowserIn: testWorld.
	workspace1 := self newWorkspaceIn: testWorld.
	workspace1 model contents: '1+1'.

	workspace2 := self newWorkspaceIn: testWorld.
	
	backupNumberOfWindowsSetting := TilingWM numberOfLastUsedWindows.
	TilingWM numberOfLastUsedWindows: 2.