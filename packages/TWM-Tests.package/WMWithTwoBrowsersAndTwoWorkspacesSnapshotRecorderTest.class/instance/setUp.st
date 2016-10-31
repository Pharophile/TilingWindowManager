running
setUp
	super setUp.
	
	workspace1 bounds: (10@10 corner: 200@200).
	workspace2 bounds: (20@20 corner: 150@150).
	browser1 minimize.
	browser2 expandBoxHit.
	workspace2 activate.
	
	worldRecorder := TWMWorldRecorder of: testWorld.
	windowManager worldRecorder: worldRecorder.
	self assert: {workspace2. workspace1. browser2} equals: windowManager visibleWindows.
	
	windowManager minimizeAllWindows.
	windowManager tileWorkspaces.
	worldRecorder snapshot.
	self assert: {workspace2. workspace1} equals: windowManager visibleWindows.
	self assert: {workspace2. workspace1} equals: (worldRecorder currentSnapshot visibleWindows).
	
	windowManager minimizeAllWindows.
	windowManager tileBrowsers.
	worldRecorder snapshot.
	self assert: {browser2. browser1} equals: windowManager visibleWindows.
	
	windowManager minimizeAllWindows.
	self assert: {} equals: windowManager visibleWindows.