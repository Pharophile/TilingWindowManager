accessing
snapshots 
	^ snapshots ifNil: [snapshots := OrderedCollection new]