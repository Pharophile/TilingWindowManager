asserting
assertWindowFillArea:  aWindow 
	self assert: (0@0 extent: 200@200) equals: aWindow bounds.
	self assert: aWindow isActive.