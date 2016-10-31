accessing
currentPosition: anInteger
	anInteger > 0 ifTrue: [currentPosition := (anInteger min: self snapshots size)].