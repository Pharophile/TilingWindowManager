tile tests
testTileToolsShouldPutTranscriptFullArea
	windowManager tileTools.
	self assertWindowFillArea: transcript.