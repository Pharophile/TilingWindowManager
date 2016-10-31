callback
worldRecorderPosition
	^ String streamContents: [:aStream| wm printWorldRecorderPositionOn: aStream]   