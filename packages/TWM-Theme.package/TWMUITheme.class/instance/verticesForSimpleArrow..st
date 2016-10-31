scrollbars
verticesForSimpleArrow: aRectangle 
	| vertices |
	vertices := OrderedCollection new.
	""
	vertices add: aRectangle bottomLeft.
	vertices add: aRectangle center x @ (aRectangle top + (aRectangle width / 8)).
	vertices add: aRectangle bottomRight.
	vertices add: aRectangle bottomRight + (0@0.01).
	""
	^ vertices