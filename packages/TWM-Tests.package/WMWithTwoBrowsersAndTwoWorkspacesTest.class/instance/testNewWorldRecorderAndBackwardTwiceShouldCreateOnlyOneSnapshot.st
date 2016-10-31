filter tests
testNewWorldRecorderAndBackwardTwiceShouldCreateOnlyOneSnapshot
	| recorder |
	recorder := TWMWorldRecorder of: testWorld.
	recorder backward backward.
	self assert: 1 equals: recorder snapshots size.