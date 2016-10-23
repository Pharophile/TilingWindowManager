filter tests
testNewWorldRecorderAndBackwardShouldCreateOnlyOneSnapshot
	| recorder |
	recorder := TWMWorldRecorder of: testWorld.
	recorder backward.
	self assert: 1 equals: recorder snapshots size.