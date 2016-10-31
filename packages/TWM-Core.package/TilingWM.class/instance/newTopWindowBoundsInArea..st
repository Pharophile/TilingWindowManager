move
newTopWindowBoundsInArea:  aBlock
	SystemWindow topWindow ifNotNil: [ 
				SystemWindow topWindow bounds: (aBlock value: world clearArea). ]