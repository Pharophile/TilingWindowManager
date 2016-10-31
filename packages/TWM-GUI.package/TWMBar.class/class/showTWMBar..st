settings
showTWMBar: aBoolean
	(ShowTWMBar := aBoolean)
		ifTrue: [self open]
		ifFalse: [self close].
		
	^ ShowTWMBar