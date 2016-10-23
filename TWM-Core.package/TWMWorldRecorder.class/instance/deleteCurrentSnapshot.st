snapshot
deleteCurrentSnapshot
	(self snapshots size = 1) not  ifTrue: [
		self snapshots remove:  self currentSnapshot.
		self currentPosition:  self currentPosition - 1.
		]