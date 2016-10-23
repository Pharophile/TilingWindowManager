initialization
initializeEdgeGrip
	|topGrip|
	topGrip := EdgeGripMorph new 
					target: self; 
					position: self position; 
					edgeName: #top.
	topGrip layoutFrame topOffset: 22.
	self addMorph: topGrip.