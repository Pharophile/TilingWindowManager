tests
testTileVisibleWindowsShouldNotCoverDockedBar
	windowManager tileVisibleWindows.
	self assert: ((leftBar width)@0 extent: (200 - leftBar width)@(200 - taskBar height)) equals: obbrowser bounds.