running
setUp
	super setUp.
	
	workspace1 bounds: (10@10 corner: 200@200).
	workspace2 bounds: (20@20 corner: 150@150).
	browser1 minimize.
	browser2 expandBoxHit.
	workspace2 activate.
	
	worldSnapshot := TWMWorldSnapshot of: testWorld.
	
	windowManager tileVisibleWindows.
	browser2 delete.
	workspace1 activate.
	worldSnapshot restore.