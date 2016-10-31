printing
printPositionOn:  aStream
	aStream  nextPutAll:   self currentPosition asString, '/',  self snapshots size asString.  