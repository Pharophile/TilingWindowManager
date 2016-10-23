tests
testWMPrintPositionShouldRenderThreeOnThree.  
	self assert: '3/3' equals: (String streamContents:  [:aStream| windowManager printWorldRecorderPositionOn:  aStream ] )