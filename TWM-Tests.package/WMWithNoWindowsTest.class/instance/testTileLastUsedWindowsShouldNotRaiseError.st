tests-tiling
testTileLastUsedWindowsShouldNotRaiseError
	self shouldnt: [windowManager tileLastUsedWindows] raise: Error.