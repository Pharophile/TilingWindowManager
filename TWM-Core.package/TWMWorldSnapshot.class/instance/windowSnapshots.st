accessing
windowSnapshots 
	^ (windowSnapshots ifNil: [windowSnapshots := {}])
		reject: [:aSnapshot| aSnapshot window owner isNil].
	