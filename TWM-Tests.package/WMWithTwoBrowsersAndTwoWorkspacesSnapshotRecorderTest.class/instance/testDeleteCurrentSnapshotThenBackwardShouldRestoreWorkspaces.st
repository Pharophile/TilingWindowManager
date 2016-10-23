tests
testDeleteCurrentSnapshotThenBackwardShouldRestoreWorkspaces
	worldRecorder deleteCurrentSnapshot backward.
	self assert: {workspace2. workspace1.} equals: windowManager visibleWindows.