tests
testDeleteCurrentSnapshotWhenRemainsOnlyOne
	| recorder |
	recorder := TWMWorldRecorder of: testWorld.
	self assert: 1 equals: recorder snapshots size.
	recorder deleteCurrentSnapshot.
	self assert: 1 equals: recorder snapshots size.
