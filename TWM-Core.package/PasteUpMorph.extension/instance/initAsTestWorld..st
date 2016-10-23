*twm-core
initAsTestWorld: aWorldState
	worldState := aWorldState.
	bounds := Display boundingBox.
	self viewBox: bounds.